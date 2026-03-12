import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  final double topPad;

  const WelcomeHeader({super.key, required this.topPad});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPad + 20,
      left: 24,
      right: 24,
      child: FadeInDown(
        duration: const Duration(milliseconds: 700),
        delay: const Duration(milliseconds: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your avatar',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                letterSpacing: -0.5,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Experience a lifestyle banking...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}