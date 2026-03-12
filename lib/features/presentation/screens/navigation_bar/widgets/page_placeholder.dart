import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/sizes.dart';

class PagePlaceholder extends StatelessWidget {
  final String label;
  final IconData icon;

  const PagePlaceholder({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 56, color: const Color(0xFFCDD5E0)),
          const SizedBox(height: ZohSizes.md),
          Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFFCDD5E0),
            ),
          ),
        ],
      ),
    );
  }
}