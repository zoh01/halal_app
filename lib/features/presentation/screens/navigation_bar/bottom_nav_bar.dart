import 'package:flutter/material.dart';
import 'package:halal_app/features/presentation/screens/navigation_bar/widgets/custom_bottom_nav_bar.dart';
import 'package:halal_app/features/presentation/screens/navigation_bar/widgets/page_placeholder.dart';

import '../home_screen/home_screen.dart';
import '../savings_screen/savings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const BackupMoneySavingsScreen(),
    const PagePlaceholder(label: 'Scan', icon: Icons.crop_free_rounded),
    const PagePlaceholder(label: 'Takaful', icon: Icons.verified_user_rounded),
    const PagePlaceholder(label: 'Profile', icon: Icons.person_rounded),
  ];

  void _onNavItemTapped(int index) {
    if (index == 2) return;
    setState(() => _selectedIndex = index);
  }

  void _onCenterButtonTapped() {
    setState(() => _selectedIndex = 2);
    // scan/camera action
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(32),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.crop_free_rounded, size: 64, color: Color(0xFF2B7FFF)),
            SizedBox(height: 16),
            Text(
              'Scan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              'Scan a QR code or document',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onNavItemTapped,
        onCenterTapped: _onCenterButtonTapped,
      ),
    );
  }
}