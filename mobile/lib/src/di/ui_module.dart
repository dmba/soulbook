import 'package:core/core.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mobile/src/pages/home/home.dart';
import 'package:mobile/src/pages/intro/intro.dart';
import 'package:mobile/src/pages/login/login.dart';

part 'package:mobile/src/di/ui_module.g.dart';

abstract class UiModule implements Module {
  const UiModule();

  factory UiModule.create() => new _$UiModule();

  @override
  void configure(container) {
    _configurePages();
  }

  @Register.factory(HomePage)
  @Register.factory(IntroPage)
  @Register.factory(LoginPage)
  void _configurePages();
}
