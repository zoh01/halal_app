import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


class WelcomeGreatChoiceLabel extends StatelessWidget {
  final Size size;
  final Animation<double> confirmFade;

  static const double kCenteredAvatarSize = 200.0;

  const WelcomeGreatChoiceLabel({
    super.key,
    required this.size,
    required this.confirmFade,
  });

  @override
  Widget build(BuildContext context) {
    final centerTop = size.height / 2 - kCenteredAvatarSize / 2 - 50;
    final labelTop = centerTop + kCenteredAvatarSize + 22;

    return Positioned(
      top: labelTop,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: confirmFade,
        child: ZoomIn(
          duration: const Duration(milliseconds: 450),
          child: const Text(
            'Great Choice!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
        ),
      ),
    );
  }
}