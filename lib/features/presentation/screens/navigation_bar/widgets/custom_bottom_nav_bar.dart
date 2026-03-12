import 'package:flutter/material.dart';
import 'package:halal_app/utils/constants/sizes.dart';

import 'center_button.dart';
import 'nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final VoidCallback onCenterTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onCenterTapped,
  });

  static const _activeColor = Color(0xFF0066F4);
  static const _inactiveColor = Color(0xFFADB5BD);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: ZohSizes.spaceBtwZoh,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 70,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Background row with nav items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavItem(
                    icon: Icons.home_rounded,
                    label: 'Home',
                    isSelected: selectedIndex == 0,
                    activeColor: _activeColor,
                    inactiveColor: _inactiveColor,
                    onTap: () => onItemTapped(0),
                  ),
                  NavItem(
                    icon: Icons.savings_outlined,
                    label: 'Savings',
                    isSelected: selectedIndex == 1,
                    activeColor: _activeColor,
                    inactiveColor: _inactiveColor,
                    onTap: () => onItemTapped(1),
                  ),
                  const SizedBox(width: 64),
                  NavItem(
                    icon: Icons.verified_user_outlined,
                    label: 'Takaful',
                    isSelected: selectedIndex == 3,
                    activeColor: _activeColor,
                    inactiveColor: _inactiveColor,
                    onTap: () => onItemTapped(3),
                  ),
                  NavItem(
                    icon: Icons.person_outline_rounded,
                    label: 'Profile',
                    isSelected: selectedIndex == 4,
                    activeColor: _activeColor,
                    inactiveColor: _inactiveColor,
                    onTap: () => onItemTapped(4),
                  ),
                ],
              ),

              Positioned(
                top: -18,
                child: CenterButton(
                  isSelected: selectedIndex == 2,
                  onTap: onCenterTapped,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}