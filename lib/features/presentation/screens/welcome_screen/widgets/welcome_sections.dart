import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:halal_app/features/domain/models/avatar_model.dart';
import 'package:halal_app/features/domain/models/welcome_screen_state.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/placeholder_bubble.dart';
import 'package:halal_app/utils/constants/image_strings.dart';

class WelcomeBackground extends StatelessWidget {
  final Size size;

  const WelcomeBackground({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Tiled pattern
        Positioned.fill(
          child: Image.asset(
            ZohImageStrings.backgroundImage,
            repeat: ImageRepeat.repeat,
            fit: BoxFit.none,
            alignment: Alignment.topLeft,
          ),
        ),

        // Upper shape
        Positioned(
          top: 0,
          left: 0,
          width: size.width * 0.55,
          child: Image.asset(
            ZohImageStrings.upperShape,
            fit: BoxFit.contain,
            alignment: Alignment.topLeft,
          ),
        ),

        // Lower shape
        Positioned(
          bottom: 0,
          right: 0,
          width: size.width * 0.50,
          child: Image.asset(
            ZohImageStrings.lowerShape,
            fit: BoxFit.contain,
            alignment: Alignment.bottomRight,
          ),
        ),
      ],
    );
  }
}