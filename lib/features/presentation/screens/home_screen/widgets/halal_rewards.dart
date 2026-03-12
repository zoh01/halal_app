import 'package:flutter/material.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/reward_card.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';


class HomeHalalRewards extends StatelessWidget {
  const HomeHalalRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ZohSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Halal Rewards',
            style: TextStyle(
              fontSize: ZohSizes.md,
              color: ZohColors.bodyTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: ZohSizes.iconXs),
          Row(
            children: [
              Expanded(
                child: RewardCard(
                  title: "Savings Earning",
                  amount: "₦500,000",
                  extra: "(+124%)",
                  button: "Create savings",
                  image: ZohImageStrings.savingsCoins,
                ),
              ),
              const SizedBox(width: ZohSizes.iconXs),
              Expanded(
                child: RewardCard(
                  title: "Reward Earned",
                  amount: "₦1200",
                  button: "View",
                  image: ZohImageStrings.rewardsCoins,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}