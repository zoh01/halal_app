import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/colors.dart';
import 'package:halal_app/utils/constants/sizes.dart';
import 'package:halal_app/utils/helper_functions/helper_functions.dart';

class RewardCard extends StatelessWidget {
  final String title;
  final String amount;
  final String? extra;
  final String button;
  final String image;

  const RewardCard({super.key,
    required this.title,
    required this.amount,
    this.extra,
    required this.button,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HelperFunctions.screenHeight(context) * .15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ZohSizes.md),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ZohSizes.md),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(ZohSizes.iconXs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: ZohSizes.fontSizeSm,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: ZohSizes.sm),

                  Row(
                    children: [
                      Text(
                        amount,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),

                      if (extra != null) ...[
                        const SizedBox(width: 4),
                        Text(
                          extra!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xF2C522BD),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]
                    ],
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      Text(
                        button,
                        style: const TextStyle(
                          fontSize: ZohSizes.iconXs,
                          color: ZohColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.arrow_forward,
                        size: 14,
                        color: ZohColors.primaryColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}