import 'package:flutter/material.dart';
import 'package:soulbook/src/di/injector.dart';
import 'package:soulbook/src/pages/home/home.dart';
import 'package:soulbook/src/pages/intro/intro.dart';
import 'package:soulbook/src/pages/login/login.dart';

const HOME = '/home';
const INTRO = '/intro';
const LOGIN = '/login';

final routes = <String, WidgetBuilder>{
  HOME: (BuildContext ctx) => Injector.of(ctx).get<HomePage>(),
  INTRO: (BuildContext ctx) => Injector.of(ctx).get<IntroPage>(),
  LOGIN: (BuildContext ctx) => Injector.of(ctx).get<LoginPage>(),
};
