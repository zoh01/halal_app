import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


class SavingsTargetAmount extends StatelessWidget {
  const SavingsTargetAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ZohSizes.spaceBtwZoh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: ZohSizes.md,
                fontWeight: FontWeight.w500,
                color: ZohColors.bodyTextColor,
              ),
              children: [
                TextSpan(text: 'Target Amount '),
                TextSpan(
                  text: '₦120,000',
                  style: TextStyle(
                    color: ZohColors.bodyTextColor,
                    fontSize: ZohSizes.fontSizeLg,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(ZohSizes.xs),
            child: LinearProgressIndicator(
              value: 50000 / 120000,
              minHeight: 5,
              backgroundColor: const Color(0xFFF9E9FF),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}