// lib/features/presentation/home_screen/widgets/transaction_tile.dart

import 'package:flutter/material.dart';
import 'package:halal_app/features/domain/models/transaction_model.dart';
import 'package:halal_app/utils/constants/colors.dart';
import 'package:halal_app/utils/constants/image_strings.dart';
import 'package:halal_app/utils/constants/sizes.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ZohSizes.iconXs),
      child: Row(
        children: [
          // MTN logo circle
          Image(
            image: AssetImage(ZohImageStrings.mtnLogo),
            height: ZohSizes.spaceBtwSections * 1.3,
          ),
          const SizedBox(width: ZohSizes.iconXs),

          // Title + amount
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    fontSize: ZohSizes.fontSizeSm,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  transaction.amount,
                  style: TextStyle(
                    fontSize: ZohSizes.fontSizeSm,
                    color: ZohColors.bodyTextColor,
                  ),
                ),
              ],
            ),
          ),

          // Time
          Text(
            transaction.time,
            style: TextStyle(
              fontSize: ZohSizes.iconXs,
              color: ZohColors.bodyTextColor,
            ),
          ),
        ],
      ),
    );
  }
}