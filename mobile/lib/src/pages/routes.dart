import 'package:flutter/material.dart';
import 'package:mobile/src/pages/home/home.dart';
import 'package:mobile/src/pages/login/login.dart';

const HOME = '/';
const LOGIN = '/login';

final routes = <String, WidgetBuilder>{
  HOME: (BuildContext context) => const HomePage(),
  LOGIN: (BuildContext context) => const LoginPage(),
};
