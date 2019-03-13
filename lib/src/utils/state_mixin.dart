import 'package:flutter/material.dart';
import 'package:mobile/generated/i18n.dart';
import 'package:mobile/src/di/injector.dart';

mixin StateMixin {
  BuildContext get context;

  S get strings => S.of(context);

  ThemeData get themeData => Theme.of(context);

  MediaQueryData get mediaQuery => MediaQuery.of(context);

  Injector get injector => Injector.of(context);
}
