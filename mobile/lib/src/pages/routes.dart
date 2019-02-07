import 'package:flutter/material.dart';
import 'package:mobile/src/di/injector.dart';
import 'package:mobile/src/pages/home/home.dart';

const HOME = '/';

final routes = <String, WidgetBuilder>{
  HOME: (BuildContext ctx) => Injector.of(ctx).get<HomePage>(),
};
