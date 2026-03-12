import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/sizes.dart';

class QuickActionButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const QuickActionButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: ZohSizes.sm,
          vertical: ZohSizes.iconXs,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: ZohSizes.fontSizeMd,
              height: ZohSizes.fontSizeMd,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.circle_outlined,
                size: 20,
                color: Color(0xFF2B7FFF),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: ZohSizes.iconXs,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}