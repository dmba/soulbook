// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_module.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$UiModule extends UiModule {
  void _configurePages() {
    final Container container = Container();
    container.registerFactory((c) => HomePage(c<CounterBloc>()));
    container.registerFactory((c) => IntroPage(c<IntroBloc>()));
  }
}
