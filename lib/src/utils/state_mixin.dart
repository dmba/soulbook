import 'package:flutter/material.dart';
import 'package:soulbook/generated/i18n.dart';
import 'package:soulbook/src/di/injector.dart';

mixin StateMixin {
  BuildContext get context;

  S get strings => S.of(context);

  ThemeData get themeData => Theme.of(context);

  MediaQueryData get mediaQuery => MediaQuery.of(context);

  Injector get injector => Injector.of(context);

  NavigatorState get navigator => Navigator.of(context);
}
