import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mobile/src/pages/home/home.dart';
import 'package:mobile/src/pages/intro/intro.dart';
import 'package:mobile/src/pages/login/auth.dart';
import 'package:mobile/src/pages/login/login.dart';

part 'package:mobile/src/di/ui_module.g.dart';

abstract class UiModule implements Module {
  const UiModule();

  factory UiModule.create() => new _$UiModule();

  @override
  void configure(Container container) {
    _configureInstances(container);
    _configureAuth();
    _configurePages();
  }

  void _configureInstances(Container container) {
    container.registerInstance(FirebaseAuth.instance);
    container.registerInstance(GoogleSignIn());
  }

  @Register.factory(Auth)
  void _configureAuth();

  @Register.factory(HomePage)
  @Register.factory(IntroPage)
  @Register.factory(LoginPage)
  void _configurePages();
}
