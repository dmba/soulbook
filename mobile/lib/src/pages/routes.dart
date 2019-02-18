import 'package:flutter/material.dart';
import 'package:mobile/src/di/injector.dart';
import 'package:mobile/src/pages/details/details.dart';
import 'package:mobile/src/pages/home/home.dart';
import 'package:mobile/src/pages/intro/intro.dart';
import 'package:mobile/src/pages/login/login.dart';

const HOME = '/home';
const INTRO = '/intro';
const LOGIN = '/login';
const DETAILS = '/details';

final routes = <String, WidgetBuilder>{
  HOME: (BuildContext ctx) => Injector.of(ctx).get<HomePage>(),
  INTRO: (BuildContext ctx) => Injector.of(ctx).get<IntroPage>(),
  LOGIN: (BuildContext ctx) => Injector.of(ctx).get<LoginPage>(),
  DETAILS: (BuildContext ctx) => Injector.of(ctx).get<DetailsPage>(),
};
