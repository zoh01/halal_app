import 'package:flutter/material.dart';

/// Shown only when an avatar image file is missing from assets.

class PlaceholderBubble extends StatelessWidget {
  final double size;
  final int index;

  const PlaceholderBubble({
    super.key,
    required this.size,
    required this.index,
  });

  static const _tones = [
    Color(0xFFD4956A), Color(0xFF8B6F47), Color(0xFF5C4033),
    Color(0xFFCB9B75), Color(0xFF3E2723), Color(0xFFBF8A6E),
    Color(0xFF6D4C41), Color(0xFFD7A87A),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFD6E8F8),
        border: Border.all(color: const Color(0xFFB3CDE8), width: 1.5),
      ),
      child: Icon(
        Icons.person_rounded,
        size: size * 0.55,
        color: _tones[index % _tones.length],
      ),
    );
  }
}