import 'package:flutter/material.dart';
import 'package:halal_app/features/presentation/screens/home_screen/widgets/transaction_tile.dart';
import 'package:halal_app/utils/constants/colors.dart';
import 'package:halal_app/utils/constants/image_strings.dart';
import 'package:halal_app/utils/constants/sizes.dart';
import 'package:halal_app/utils/helper_functions/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../domain/models/transaction_model.dart';
import 'reward_card.dart';

class HomeTopSection extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeTopSection({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              ZohSizes.md,
              topPad + ZohSizes.iconXs,
              ZohSizes.md,
              ZohSizes.iconXs,
            ),
            child: Row(
              children: [
                // Avatar
                GestureDetector(
                  onTap: () => scaffoldKey.currentState?.openDrawer(),
                  child: ClipOval(
                    child: Image.asset(
                      ZohImageStrings.avatar,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.person_rounded,
                        color: ZohColors.primaryOpacity,
                        size: 26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: ZohSizes.iconXs),

                // Greeting
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi Mohammed,',
                        style: TextStyle(
                          fontSize: ZohSizes.fontSizeLg,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Text(
                        'Do more with your finances',
                        style: TextStyle(
                          fontSize: ZohSizes.iconXs,
                          color: ZohColors.bodyTextColor,
                        ),
                      ),
                    ],
                  ),
                ),

                // Tier badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ZohSizes.iconXs,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: ZohColors.primaryOpacity,
                    borderRadius: BorderRadius.circular(ZohSizes.spaceBtwZoh),
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(ZohImageStrings.verify),
                        height: ZohSizes.md,
                        width: ZohSizes.md,
                      ),
                      const SizedBox(width: ZohSizes.xs),
                      Text(
                        'Tier 3',
                        style: TextStyle(
                          fontSize: ZohSizes.fontSizeSm,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),

                // Notification bell
                const Icon(
                  Iconsax.notification,
                  size: ZohSizes.defaultSpace,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
