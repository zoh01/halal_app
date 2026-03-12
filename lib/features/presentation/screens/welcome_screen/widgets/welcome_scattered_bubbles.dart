import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/placeholder_bubble.dart';

import '../../../../domain/models/avatar_model.dart';
import '../../../../domain/models/welcome_screen_state.dart';


class WelcomeScatteredBubbles extends StatelessWidget {
  final Size size;
  final WelcomeScreenState screenState;
  final int selectedIndex;
  final Animation<double> selectProgress;
  final Function(int) onAvatarTapped;

  const WelcomeScatteredBubbles({
    super.key,
    required this.size,
    required this.screenState,
    required this.selectedIndex,
    required this.selectProgress,
    required this.onAvatarTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(kAvatarAssets.length, (i) {
        final layout = kLayouts[i];
        final bubbleSize = 88.0 * layout.s * 1.2;
        final isSelected = i == selectedIndex;

        final restLeft =
            size.width / 2 + size.width * layout.x - bubbleSize / 2;
        final restTop =
            size.height / 2 + size.height * layout.y - bubbleSize / 2;

        final exitTop = size.height + bubbleSize + 40;
        final flyLeft = size.width / 2 - bubbleSize / 2;
        final flyTop = size.height / 2 - bubbleSize / 2 - 50;

        final entranceDelay = Duration(milliseconds: 55 * i);

        return AnimatedBuilder(
          animation: selectProgress,
          builder: (context, _) {
            final selProg = selectProgress.value;

            double left = restLeft;
            double top = restTop;
            double opacity = 1.0;
            double scale = 1.0;

            if (screenState == WelcomeScreenState.selecting) {
              if (isSelected) {
                left = _lerp(restLeft, flyLeft, selProg);
                top = _lerp(restTop, flyTop, selProg);
                scale = _lerp(1.0, 1.15, selProg);
                opacity = 1.0;
              } else {
                final exitProg = Curves.easeIn.transform(selProg);
                top = _lerp(restTop, exitTop, exitProg * 0.9);
                opacity = (1.0 - exitProg * 1.3).clamp(0.0, 1.0);
              }
            }

            return Positioned(
              left: left,
              top: top,
              child: Opacity(
                opacity: opacity.clamp(0.0, 1.0),
                child: Transform.scale(
                  scale: scale,
                  alignment: Alignment.center,
                  child: FadeInDown(
                    duration: const Duration(milliseconds: 550),
                    delay: entranceDelay,
                    from: 55,
                    child: GestureDetector(
                      onTap: () => onAvatarTapped(i),
                      child: SizedBox(
                        width: bubbleSize,
                        height: bubbleSize,
                        child: Image.asset(
                          kAvatarAssets[i],
                          width: bubbleSize,
                          height: bubbleSize,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => PlaceholderBubble(
                            size: bubbleSize,
                            index: i,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  double _lerp(double a, double b, double t) => a + (b - a) * t;
}