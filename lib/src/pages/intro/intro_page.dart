import 'package:flutter/material.dart';
import 'package:mobile/src/blocs/intro/intro.dart';
import 'package:mobile/src/utils/state_mixin.dart';

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
  Widget build(BuildContext context) => const Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Text("Intro page"),
        ),
      );
}
