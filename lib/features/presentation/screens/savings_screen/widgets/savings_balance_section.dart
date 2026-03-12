import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


class SavingsBalanceSection extends StatelessWidget {
  const SavingsBalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Total Savings Balance',
            style: TextStyle(
              fontSize: ZohSizes.fontSizeSm,
              color: ZohColors.bodyTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: ZohSizes.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '₦50,000.00',
                style: TextStyle(
                  fontSize: ZohSizes.spaceBtwSections,
                  fontWeight: FontWeight.w500,
                  color: ZohColors.darkerGrey,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: ZohSizes.sm),
              Icon(
                Icons.remove_red_eye_outlined,
                size: ZohSizes.spaceBtwZoh,
                color: ZohColors.darkerGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}