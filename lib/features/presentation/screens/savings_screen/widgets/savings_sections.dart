import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/sizes.dart';

class SavingsAppBar extends StatelessWidget {
  const SavingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(
        top: topPad + ZohSizes.iconXs,
        left: ZohSizes.spaceBtwZoh,
        right: ZohSizes.spaceBtwZoh,
        bottom: ZohSizes.fontSizeSm,
      ),
      color: Colors.white,
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.chevron_left_rounded,
              size: 28,
              color: Colors.black,
            ),
          ),
          const Spacer(),

          // Title
          const Text(
            'Backup money',
            style: TextStyle(
              fontSize: ZohSizes.fontSizeLg,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: ZohSizes.sm),

          // "Spend To Save" badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: ZohSizes.sm,
              vertical: ZohSizes.xs,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF9E9FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Spend To Save',
              style: TextStyle(
                fontSize: ZohSizes.iconXs,
                fontWeight: FontWeight.w500,
                color: Color(0xFF9B59B6),
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(width: 28),
        ],
      ),
    );
  }
}


