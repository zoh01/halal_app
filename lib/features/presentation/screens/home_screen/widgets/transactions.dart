import 'package:flutter/material.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/transaction_tile.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../domain/models/transaction_model.dart';


class HomeTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const HomeTransactions({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ZohSizes.md),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transactions',
                style: TextStyle(
                  fontSize: ZohSizes.md,
                  fontWeight: FontWeight.w600,
                  color: ZohColors.bodyTextColor,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'View all',
                  style: TextStyle(
                    fontSize: ZohSizes.fontSizeSm,
                    color: ZohColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: ZohSizes.iconXs),
          ...List.generate(transactions.length, (index) {
            final t = transactions[index];
            return Column(
              children: [
                TransactionTile(transaction: t),
                if (index != transactions.length - 1)
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF9E9FF),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}