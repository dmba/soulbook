import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/pages/login/auth.dart';
import 'package:mobile/src/pages/routes.dart';
import 'package:mobile/src/utils/state_mixin.dart';

class LoginPage extends StatefulWidget {
  LoginPage(this._bloc, this._auth) : super();

  final LoginBloc _bloc;
  final Auth _auth;

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _loginPage(),
    );
  }

  Widget _loginPage() {
    return Container(
      width: mediaQuery.size.width,
      margin: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 120.0),
            child: Center(
              child: Text(
                strings.title,
                maxLines: 1,
                style: const TextStyle(
                  color: Color.fromARGB(255, 180, 66, 122),
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                strings.email,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 180, 66, 122),
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          Container(
            width: mediaQuery.size.width,
            margin: const EdgeInsets.only(top: 10.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: const BorderSide(
                    color: const Color.fromARGB(255, 180, 66, 122),
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: strings.hintMail,
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 24.0,
          ),
          Row(
            children: <Widget>[
              Text(
                strings.password,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 180, 66, 122),
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          Container(
            width: mediaQuery.size.width,
            margin: const EdgeInsets.only(top: 10.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Color.fromARGB(255, 180, 66, 122),
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: strings.hintPassword,
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text(
                  strings.forgotPassword,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 180, 66, 122),
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.end,
                ),
                onPressed: _onForgotPasswordPressed(context),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FloatingActionButton.extended(
                    onPressed: _onLoginPress(context),
                    label: Text(strings.login),
                    backgroundColor: const Color.fromARGB(255, 180, 66, 122),
                    icon: const Icon(Icons.expand_more),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: mediaQuery.size.width,
            margin: const EdgeInsets.only(top: 20.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
                  ),
                ),
                Text(
                  strings.orConnectWith,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: FloatingActionButton.extended(
                    onPressed: _onFacebookPress(context),
                    label: Text(strings.facebook),
                    backgroundColor: const Color(0Xff3B5998),
                    icon: const Icon(Icons.transit_enterexit),
                  ),
                ),
                Container(
                  width: 8,
                ),
                Expanded(
                  child: FloatingActionButton.extended(
                    onPressed: _onGooglePress(context),
                    label: Text(strings.google),
                    backgroundColor: const Color(0Xffdb3236),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onGooglePress(BuildContext context) {
    return () async {
      final firebaseUser = await widget._auth.signInWithGoogle();
      Navigator.of(context).pushReplacementNamed(HOME);
    };
  }

  _onFacebookPress(BuildContext context) {
    return () {};
  }

  _onLoginPress(BuildContext context) {
    return () {};
  }

  _onForgotPasswordPressed(BuildContext context) {
    return () {};
  }
}
