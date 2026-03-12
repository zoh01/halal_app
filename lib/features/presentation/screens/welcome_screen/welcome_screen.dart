import 'package:flutter/material.dart';
import 'package:halal_app/features/domain/models/welcome_screen_state.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/continue_button.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/great_choice_label.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/welcome_centered_avatar.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/welcome_header.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/welcome_scattered_bubbles.dart';
import 'package:halal_app/features/presentation/screens/welcome_screen/widgets/welcome_sections.dart';

import '../navigation_bar/bottom_nav_bar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {

  WelcomeScreenState _screenState = WelcomeScreenState.idle;
  int _selectedIndex = -1;

  late AnimationController _selectCtrl;
  late Animation<double> _selectProgress;

  late AnimationController _popCtrl;
  late Animation<double> _popScale;

  late AnimationController _confirmCtrl;
  late Animation<Offset> _buttonSlide;
  late Animation<double> _confirmFade;

  @override
  void initState() {
    super.initState();

    _selectCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _selectProgress = CurvedAnimation(
      parent: _selectCtrl,
      curve: Curves.easeInOut,
    );

    _popCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _popScale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.12)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.12, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 40,
      ),
    ]).animate(_popCtrl);

    _confirmCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _buttonSlide = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _confirmCtrl, curve: Curves.easeOut));
    _confirmFade =
        CurvedAnimation(parent: _confirmCtrl, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _selectCtrl.dispose();
    _popCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _onAvatarTapped(int index) async {
    if (_screenState != WelcomeScreenState.idle) return;

    setState(() {
      _selectedIndex = index;
      _screenState = WelcomeScreenState.selecting;
    });

    // selected flies to center, others fall down
    await _selectCtrl.forward();
    if (!mounted) return;

    // big avatar pops in
    setState(() => _screenState = WelcomeScreenState.selected);
    await _popCtrl.forward();
    if (!mounted) return;

    // "Great Choice!" & button appear
    await _confirmCtrl.forward();
  }

  void _onContinue() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BottomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPad = MediaQuery.of(context).padding.top;
    final bottomPad = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          WelcomeBackground(size: size),

          if (_screenState != WelcomeScreenState.selected)
            WelcomeScatteredBubbles(
              size: size,
              screenState: _screenState,
              selectedIndex: _selectedIndex,
              selectProgress: _selectProgress,
              onAvatarTapped: _onAvatarTapped,
            ),

          if (_screenState == WelcomeScreenState.selected)
            WelcomeCenteredAvatar(
              size: size,
              selectedIndex: _selectedIndex,
              popScale: _popScale,
            ),

          if (_screenState == WelcomeScreenState.selected)
            WelcomeGreatChoiceLabel(
              size: size,
              confirmFade: _confirmFade,
            ),

          WelcomeHeader(topPad: topPad),

          if (_screenState == WelcomeScreenState.selected)
            WelcomeContinueButton(
              bottomPad: bottomPad,
              buttonSlide: _buttonSlide,
              confirmFade: _confirmFade,
              onContinue: _onContinue,
            ),
        ],
      ),
    );
  }
}