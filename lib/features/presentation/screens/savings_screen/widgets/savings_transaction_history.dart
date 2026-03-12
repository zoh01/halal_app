import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../domain/models/savings_tx_model.dart';

class SavingsTransactionHistory extends StatelessWidget {
  final List<SavingsTx> transactions;

  const SavingsTransactionHistory({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: ZohSizes.spaceBtwZoh),
          child: Text(
            'Transaction History',
            style: TextStyle(
              fontSize: ZohSizes.fontSizeLg,
              fontWeight: FontWeight.w700,
              color: ZohColors.bodyTextColor,
            ),
          ),
        ),
        const SizedBox(height: ZohSizes.md),
        ...List.generate(transactions.length, (i) {
          final tx = transactions[i];
          return Opacity(
            opacity: tx.faded ? 0.35 : 1.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ZohSizes.spaceBtwZoh,
                    vertical: ZohSizes.fontSizeSm,
                  ),
                  child: Row(
                    children: [
                      // Icon circle
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: tx.isTopUp
                              ? const Color(0xFFE2F8E8)
                              : const Color(0xFFEBF3FF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          tx.isTopUp
                              ? Icons.south_east_rounded
                              : Icons.north_west_rounded,
                          color: tx.isTopUp
                              ? Colors.green
                              : ZohColors.primaryColor,
                          size: ZohSizes.spaceBtwZoh,
                        ),
                      ),
                      const SizedBox(width: ZohSizes.fontSizeSm),

                      // Amount + type
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.amount,
                              style: const TextStyle(
                                fontSize: ZohSizes.fontSizeLg,
                                fontWeight: FontWeight.w500,
                                color: ZohColors.black,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              tx.type,
                              style: TextStyle(
                                fontSize: ZohSizes.fontSizeSm,
                                color: ZohColors.bodyTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Date
                      Text(
                        tx.date,
                        style: TextStyle(
                          fontSize: ZohSizes.iconXs,
                          color: ZohColors.bodyTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                if (i != transactions.length - 1)
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Color(0xFFF9E9FF),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }
}