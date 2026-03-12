import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/colors.dart';
import 'package:halal_app/utils/constants/image_strings.dart';
import 'package:halal_app/utils/constants/sizes.dart';
import 'package:halal_app/utils/helper_functions/helper_functions.dart';

import '../home_screen.dart';
import 'drawer_tile.dart';

class SideNavDrawer extends StatelessWidget {
  const SideNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).padding.bottom;

    return Drawer(
      width: HelperFunctions.screenWidth(context) * .77,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: ZohSizes.sm),
              children: [
                DrawerTile(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  onTap: () => _close(context),
                ),
                DrawerTile(
                  icon: Icons.savings_rounded,
                  label: 'Savings',
                  onTap: () => _close(context),
                ),
                DrawerTile(
                  icon: Icons.send_rounded,
                  label: 'Send Money',
                  onTap: () => _close(context),
                ),
                DrawerTile(
                  icon: Icons.download_rounded,
                  label: 'Receive Money',
                  onTap: () => _close(context),
                ),
                DrawerTile(
                  icon: Icons.phone_android_rounded,
                  label: 'Airtime & Bills',
                  onTap: () => _close(context),
                ),
                DrawerTile(
                  icon: Icons.verified_user_rounded,
                  label: 'Takaful',
                  onTap: () => _close(context),
                ),
                DrawerTile(
                  icon: Icons.card_giftcard_rounded,
                  label: 'Halal Rewards',
                  onTap: () => _close(context),
                ),
                DrawerTile(
                  icon: Icons.history_rounded,
                  label: 'Transaction History',
                  onTap: () => _close(context),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Divider(color: Color(0xFFF0F0F0)),
                ),

                DrawerTile(
                  icon: Icons.settings_rounded,
                  label: 'Settings',
                  onTap: () => _close(context),
                ),
                DrawerTile(
                  icon: Icons.help_outline_rounded,
                  label: 'Help & Support',
                  onTap: () => _close(context),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              ZohSizes.spaceBtwZoh,
              0,
              ZohSizes.spaceBtwZoh,
              bottomPad + ZohSizes.defaultSpace,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: ZohSizes.fontSizeSm,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F0),
                  borderRadius: BorderRadius.circular(ZohSizes.iconXs),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                      size: ZohSizes.spaceBtwZoh,
                    ),
                    SizedBox(width: ZohSizes.sm),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        ZohSizes.spaceBtwZoh,
        topPad + ZohSizes.defaultSpace,
        ZohSizes.spaceBtwZoh,
        ZohSizes.defaultSpace,
      ),
      decoration: const BoxDecoration(color: ZohColors.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          ClipOval(
            child: Image.asset(
              ZohImageStrings.avatar,
              height: ZohSizes.spaceBtwSections * 2,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFFD6E8F8),
                child: const Icon(
                  Icons.person_rounded,
                  color: Color(0xFF6B9DC2),
                  size: 36,
                ),
              ),
            ),
          ),
          const SizedBox(height: ZohSizes.iconXs),

          // Name
          const Text(
            'Hi Muhammed,',
            style: TextStyle(
              fontSize: ZohSizes.fontSizeLg,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: ZohSizes.xs),
          const Text(
            'Do more with your finances',
            style: TextStyle(fontSize: 13, color: Colors.white70),
          ),
          const SizedBox(height: 10),

          // Tier badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white38),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_rounded,
                  color: Colors.white,
                  size: ZohSizes.fontSizeSm,
                ),
                SizedBox(width: ZohSizes.xs),
                Text(
                  'Tier 3',
                  style: TextStyle(
                    fontSize: ZohSizes.iconXs,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _close(BuildContext context) => Navigator.pop(context);
}