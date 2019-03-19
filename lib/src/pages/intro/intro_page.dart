import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:soulbook/src/blocs/intro/intro.dart';
import 'package:soulbook/src/pages/routes.dart';
import 'package:soulbook/src/utils/state_mixin.dart';

class IntroPage extends StatefulWidget {
  IntroPage(this._bloc) : super();

  final IntroBloc _bloc;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with StateMixin {
  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      colorActiveDot: themeData.primaryColor,
      colorDot: Colors.grey,
      colorDoneBtn: themeData.primaryColor,
      colorSkipBtn: themeData.primaryColor,
      slides: [
        Slide(
          backgroundImage: "assets/intro0.png",
          backgroundImageFit: BoxFit.fitHeight,
          backgroundOpacity: 0,
        ),
        Slide(
          backgroundImage: "assets/intro1.png",
          backgroundImageFit: BoxFit.fitHeight,
          backgroundOpacity: 0,
        ),
        Slide(
          backgroundImage: "assets/intro2.png",
          backgroundImageFit: BoxFit.fitHeight,
          backgroundOpacity: 0,
        ),
      ],
      onDonePress: _onDonePress,
      onSkipPress: _onSkipPress,
    );
  }

  void _onDonePress() {
    navigator.pushReplacementNamed(LOGIN);
  }

  void _onSkipPress() {
    navigator.pushReplacementNamed(LOGIN);
  }
}
