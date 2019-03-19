import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulbook/generated/i18n.dart';
import 'package:soulbook/src/blocs/auth/auth.dart';
import 'package:soulbook/src/pages/home/home.dart';
import 'package:soulbook/src/pages/intro/intro.dart';
import 'package:soulbook/src/pages/login/login.dart';
import 'package:soulbook/src/pages/routes.dart';
import 'package:soulbook/src/pages/splash/splash.dart';
import 'package:soulbook/src/utils/non_null_guard.dart';
import 'package:soulbook/src/utils/state_mixin.dart';
import 'package:soulbook/src/widgets/loading_indicator_widget.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with StateMixin {
  AuthBloc _authBloc;

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initAuthBlock();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.pink,
      ),
      routes: routes,
      home: _homeBuilder(),
    );
  }

  void _initAuthBlock() {
    if (_authBloc == null) {
      _authBloc = injector.get<AuthBloc>();
      _authBloc.dispatchAppStart();
    }
  }

  BlocBuilder<AuthEvent, AuthState> _homeBuilder() {
    return BlocBuilder<AuthEvent, AuthState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthState state) {
        switch (state) {
          case AuthState.FIRST_START:
            return injector.get<IntroPage>();
          case AuthState.UNINITIALIZED:
            return injector.get<SplashPage>();
          case AuthState.AUTHENTICATED:
            return injector.get<HomePage>();
          case AuthState.UNAUTHENTICATED:
            return injector.get<LoginPage>();
          case AuthState.LOADING:
            return LoadingIndicatorWidget();
        }
      },
    );
  }
}
