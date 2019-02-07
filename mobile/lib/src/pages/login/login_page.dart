import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/utils/state_mixin.dart';

class LoginPage extends StatefulWidget {
  LoginPage(this._bloc) : super();

  final LoginBloc _bloc;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with StateMixin {
  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Text("Login page"),
        ),
      );
}
