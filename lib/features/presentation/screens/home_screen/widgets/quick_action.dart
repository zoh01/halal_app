import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/quick_action_button.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';
import '../../airtime_bills/airtime_bills_screen.dart';


class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: ZohSizes.iconXs),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ZohSizes.iconXs),
        child: Container(
          height: HelperFunctions.screenHeight(context) * .15,
          decoration: BoxDecoration(
            color: ZohColors.primaryOpacity,
            borderRadius: BorderRadius.circular(ZohSizes.iconXs),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Background Image
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  ZohImageStrings.backgroundAction,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: ZohSizes.sm),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Quick Actions',
                          style: TextStyle(
                            fontSize: ZohSizes.md,
                            fontWeight: FontWeight.w600,
                            color: ZohColors.bodyTextColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                'More Services',
                                style: TextStyle(
                                  fontSize: ZohSizes.iconXs,
                                  color: ZohColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3,
                                  decoration: TextDecoration.underline,
                                  decorationColor: ZohColors.primaryColor,
                                  decorationThickness: 1.5,
                                ),
                              ),
                              const SizedBox(width: 3),
                              const Icon(
                                Icons.arrow_forward,
                                size: ZohSizes.md,
                                color: ZohColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: ZohSizes.md),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        QuickActionButton(
                          imagePath: ZohImageStrings.sendMoneyIcon,
                          label: 'Send Money',
                          onTap: () {},
                        ),
                        SizedBox(width: ZohSizes.xs),
                        QuickActionButton(
                          imagePath: ZohImageStrings.receiveMoneyIcon,
                          label: 'Receive Money',
                          onTap: () {},
                        ),
                        SizedBox(width: ZohSizes.xs),
                        QuickActionButton(
                          imagePath: ZohImageStrings.airtimeIcon,
                          label: 'Airtime & Bills',
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => AirtimeBillsScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}