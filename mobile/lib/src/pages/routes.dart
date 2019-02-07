import 'package:flutter/material.dart';
import 'package:mobile/src/di/injector.dart';
import 'package:mobile/src/pages/home/home.dart';
import 'package:mobile/src/pages/intro/intro.dart';
import 'package:mobile/src/pages/login/login.dart';

const HOME = '/';
const INTRO = '/intro';
const LOGIN = '/login';

final routes = <String, WidgetBuilder>{
  HOME: (BuildContext ctx) => Injector.of(ctx).get<HomePage>(),
  INTRO: (BuildContext ctx) => Injector.of(ctx).get<IntroPage>(),
  LOGIN: (BuildContext ctx) => Injector.of(ctx).get<LoginPage>(),
};
