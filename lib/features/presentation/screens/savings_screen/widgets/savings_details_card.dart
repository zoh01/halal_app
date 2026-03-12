import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class SavingsDetailsCard extends StatefulWidget {
  const SavingsDetailsCard({super.key});

  @override
  State<SavingsDetailsCard> createState() => _SavingsDetailsCardState();
}

class _SavingsDetailsCardState extends State<SavingsDetailsCard> {
  int _selectedDotIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ZohSizes.spaceBtwZoh),
      child: Container(
        padding: const EdgeInsets.all(ZohSizes.md),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ZohSizes.md),
          border: Border.all(color: const Color(0xFFF0F0F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: ZohSizes.iconXs,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Image(
                  image: AssetImage(ZohImageStrings.savings),
                  height: ZohSizes.spaceBtwSections,
                  width: ZohSizes.spaceBtwSections,
                ),
                const SizedBox(width: ZohSizes.sm),
                const Text(
                  'Savings Details',
                  style: TextStyle(
                    fontSize: ZohSizes.md,
                    fontWeight: FontWeight.w500,
                    color: ZohColors.bodyTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: ZohSizes.sm),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: ZohSizes.fontSizeSm,
                  color: Color(0xFF0D1B2A),
                  height: 1.5,
                ),
                children: [
                  TextSpan(text: 'Your Savings start date is '),
                  TextSpan(
                    text: '23rd September 2023',
                    style: TextStyle(
                      color: ZohColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: ' and will mature by '),
                  TextSpan(
                    text: '23rd December 2023',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: ZohSizes.md),

            // Page indicator dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (i) {
                final isActive = i == _selectedDotIndex;
                return GestureDetector(
                  onTap: () => setState(() => _selectedDotIndex = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: isActive ? ZohSizes.spaceBtwZoh : ZohSizes.sm,
                    height: 5,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.black : const Color(0xFFDDDDDD),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}