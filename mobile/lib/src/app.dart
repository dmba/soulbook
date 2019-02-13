import 'package:flutter/material.dart';
import 'package:mobile/generated/i18n.dart';
import 'package:mobile/src/pages/routes.dart';
import 'package:mobile/src/utils/non_null_guard.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: nonNullGuard(
        callback: S.delegate.resolution,
        fallback: const Locale('en', ''),
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: LOGIN,
    );
  }
}
