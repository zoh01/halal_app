import 'package:flutter/material.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/placeholder_bubble.dart';

import '../../../../domain/models/avatar_model.dart';


class WelcomeCenteredAvatar extends StatelessWidget {
  final Size size;
  final int selectedIndex;
  final Animation<double> popScale;

  static const double kCenteredAvatarSize = 200.0;

  const WelcomeCenteredAvatar({
    super.key,
    required this.size,
    required this.selectedIndex,
    required this.popScale,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: popScale,
      builder: (context, _) {
        final scaledSize = kCenteredAvatarSize * popScale.value;
        final left = size.width / 2 - scaledSize / 2;
        final top = size.height / 2 - scaledSize / 2 - 50;

        return Positioned(
          left: left,
          top: top,
          child: ClipOval(
            child: Image.asset(
              kAvatarAssets[selectedIndex],
              width: scaledSize,
              height: scaledSize,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => PlaceholderBubble(
                size: scaledSize,
                index: selectedIndex,
              ),
            ),
          ),
        );
      },
    );
  }
}