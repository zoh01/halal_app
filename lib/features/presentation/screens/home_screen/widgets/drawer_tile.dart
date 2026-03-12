// lib/features/presentation/home_screen/widgets/drawer_tile.dart

import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2B7FFF) : const Color(0xFFF5F7FA),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 20,
          color: isActive
              ? Colors.white
              : const Color(0xFF0D1B2A).withOpacity(0.6),
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          color: isActive ? const Color(0xFF2B7FFF) : const Color(0xFF0D1B2A),
        ),
      ),
      trailing: isActive
          ? const Icon(
        Icons.chevron_right_rounded,
        color: Color(0xFF2B7FFF),
        size: 20,
      )
          : null,
    );
  }
}