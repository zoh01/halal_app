import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/colors.dart';

class SavingsChartPainter extends CustomPainter {
  final List<double> data;
  final int peakIndex;
  final int? touchedIndex;

  const SavingsChartPainter({
    required this.data,
    required this.peakIndex,
    this.touchedIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final w = size.width;
    final h = size.height;
    final step = w / (data.length - 1);
    const topPad = 40.0;
    const bottomPad = 10.0;
    final chartH = h - topPad - bottomPad;

    // Build points
    List<Offset> pts = List.generate(data.length, (i) {
      final x = i * step;
      final y = topPad + chartH * (1.0 - data[i]);
      return Offset(x, y);
    });

    final fillPath = Path();
    fillPath.moveTo(pts[0].dx, pts[0].dy);
    _addCurve(fillPath, pts);
    fillPath.lineTo(w, h);
    fillPath.lineTo(0, h);
    fillPath.close();

    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ZohColors.primaryColor.withOpacity(0.15),
            ZohColors.primaryColor.withOpacity(0.0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, w, h)),
    );

    final linePath = Path();
    linePath.moveTo(pts[0].dx, pts[0].dy);
    _addCurve(linePath, pts);

    canvas.drawPath(
      linePath,
      Paint()
        ..color = ZohColors.primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // Peak dashed vertical line
    final peakPt = pts[peakIndex];
    _drawDashedLine(
      canvas,
      Offset(peakPt.dx, peakPt.dy),
      Offset(peakPt.dx, h),
      const Color(0xFF27AE60),
    );

    // Peak green dot
    canvas.drawCircle(peakPt, 6, Paint()..color = const Color(0xFF27AE60));
    canvas.drawCircle(peakPt, 3, Paint()..color = Colors.white);

    // Tooltip at peak
    _drawTooltip(canvas, peakPt, size);
  }

  void _addCurve(Path path, List<Offset> pts) {
    for (int i = 0; i < pts.length - 1; i++) {
      final cp1 = Offset((pts[i].dx + pts[i + 1].dx) / 2, pts[i].dy);
      final cp2 = Offset((pts[i].dx + pts[i + 1].dx) / 2, pts[i + 1].dy);
      path.cubicTo(
        cp1.dx,
        cp1.dy,
        cp2.dx,
        cp2.dy,
        pts[i + 1].dx,
        pts[i + 1].dy,
      );
    }
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Color color) {
    const dashH = 6.0;
    const gapH = 4.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double y = start.dy;
    while (y < end.dy) {
      canvas.drawLine(
        Offset(start.dx, y),
        Offset(start.dx, math.min(y + dashH, end.dy)),
        paint,
      );
      y += dashH + gapH;
    }
  }

  void _drawTooltip(Canvas canvas, Offset anchor, Size size) {
    const tooltipW = 100.0;
    const tooltipH = 44.0;
    const radius = 8.0;
    const padding = 8.0;

    double left = anchor.dx + 10;
    if (left + tooltipW > size.width - 8) left = anchor.dx - tooltipW - 10;

    final top = anchor.dy - tooltipH - 8;
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, tooltipW, tooltipH),
      const Radius.circular(radius),
    );

    // Shadow
    canvas.drawRRect(
      rect,
      Paint()
        ..color = Colors.black.withOpacity(0.08)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );

    // White background
    canvas.drawRRect(rect, Paint()..color = Colors.white);

    // "Amount Saved" label
    final labelPainter = TextPainter(
      text: TextSpan(
        text: 'Amount Saved',
        style: TextStyle(
          fontSize: 9,
          color: Colors.black.withOpacity(0.45),
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: tooltipW - padding * 2);
    labelPainter.paint(canvas, Offset(left + padding, top + 7));

    // Amount value
    final valuePainter = TextPainter(
      text: const TextSpan(
        text: '₦2,250',
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFF0D1B2A),
          fontWeight: FontWeight.w700,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: tooltipW - padding * 2);
    valuePainter.paint(canvas, Offset(left + padding, top + 18));

    // Date
    final datePainter = TextPainter(
      text: TextSpan(
        text: 'Mar 25th, 2023',
        style: TextStyle(fontSize: 9, color: Colors.black.withOpacity(0.4)),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: tooltipW - padding * 2);
    datePainter.paint(canvas, Offset(left + padding, top + 32));
  }

  @override
  bool shouldRepaint(covariant SavingsChartPainter old) =>
      old.touchedIndex != touchedIndex;
}