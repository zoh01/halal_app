import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  Balance + Credit Score Section
//  Drop this widget wherever you need it in your dashboard scroll view.
// ─────────────────────────────────────────────────────────────────────────────

class BalanceCreditSection extends StatefulWidget {
  const BalanceCreditSection({super.key});

  @override
  State<BalanceCreditSection> createState() => _BalanceCreditSectionState();
}

class _BalanceCreditSectionState extends State<BalanceCreditSection> {
  bool _balanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // ── Blue balance card ──────────────────────────────────────────────
        _buildBalanceCard(),

        // ── White credit score card — overlaps the blue card at the bottom ─
        Positioned(
          bottom: -36,
          left: 16,
          right: 16,
          child: _buildCreditScoreCard(),
        ),
      ],
    );
  }

  // ── Blue balance card ────────────────────────────────────────────────────

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 52),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2B7FFF), Color(0xFF1A5FCC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Left: Wallet Balance + Amount ──────────────────────────────
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Wallet Balance',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _balanceVisible ? '₦500,387.00' : '₦ ••••••',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => _balanceVisible = !_balanceVisible),
                    child: Icon(
                      _balanceVisible
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white.withOpacity(0.85),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // ── Right: Bank name + Account number ─────────────────────────
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Halal-Welfare MFB',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    '0123456789',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        const ClipboardData(text: '0123456789'),
                      );
                    },
                    child: Icon(
                      Icons.copy_rounded,
                      color: Colors.white.withOpacity(0.85),
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── White credit score card ──────────────────────────────────────────────

  Widget _buildCreditScoreCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // "My Credit Score is 550"
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0D1B2A),
              ),
              children: [
                TextSpan(text: 'My Credit Score is '),
                TextSpan(
                  text: '550',
                  style: TextStyle(
                    color: Color(0xFFE8A020), // amber/gold
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // "Medium" badge with circular icon
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF3E3), // soft amber background
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Circular gauge icon
                SizedBox(
                  width: 22,
                  height: 22,
                  child: CustomPaint(
                    painter: _CreditGaugePainter(),
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'Medium',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFE8A020),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Custom painter for the credit score gauge ring
// ─────────────────────────────────────────────────────────────────────────────

class _CreditGaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;

    // Background ring
    final bgPaint = Paint()
      ..color = const Color(0xFFE8A020).withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Foreground arc — ~60% filled (medium credit)
    final fgPaint = Paint()
      ..color = const Color(0xFFE8A020)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -2.4,   // start angle (roughly -135deg)
      3.0,    // sweep angle (~60% of circle)
      false,
      fgPaint,
    );

    // Center dot
    canvas.drawCircle(
      center,
      2.5,
      Paint()..color = const Color(0xFFE8A020),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}