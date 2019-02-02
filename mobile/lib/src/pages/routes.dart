import 'package:flutter/material.dart';
import 'package:mobile/src/pages/home/home.dart';
import 'package:mobile/src/pages/intro/intro.dart';
import 'package:mobile/src/pages/login/login.dart';

const HOME = '/';
const INTRO = '/intro';
const LOGIN = '/login';

final routes = <String, WidgetBuilder>{
  HOME: (BuildContext ctx) => const HomePage(),
  INTRO: (BuildContext ctx) => const IntroPage(),
  LOGIN: (BuildContext ctx) => const LoginPage(),
};
