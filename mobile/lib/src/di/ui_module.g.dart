// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_module.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$UiModule extends UiModule {
  void _configureAuth() {
    final Container container = Container();
    container.registerFactory((c) =>
        Auth(googleSignIn: c<GoogleSignIn>(), firebaseAuth: c<FirebaseAuth>()));
  }

  void _configurePages() {
    final Container container = Container();
    container.registerFactory((c) => HomePage(c<CounterBloc>()));
    container.registerFactory((c) => IntroPage(c<IntroBloc>()));
    container.registerFactory((c) => LoginPage(c<LoginBloc>(), c<Auth>()));
    container.registerFactory((c) => SplashPage());
  }
}
