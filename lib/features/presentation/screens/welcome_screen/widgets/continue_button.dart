import 'package:flutter/material.dart';


class WelcomeContinueButton extends StatelessWidget {
  final double bottomPad;
  final Animation<Offset> buttonSlide;
  final Animation<double> confirmFade;
  final VoidCallback onContinue;

  const WelcomeContinueButton({
    super.key,
    required this.bottomPad,
    required this.buttonSlide,
    required this.confirmFade,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottomPad + 36,
      left: 28,
      right: 28,
      child: SlideTransition(
        position: buttonSlide,
        child: FadeTransition(
          opacity: confirmFade,
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B7FFF),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}