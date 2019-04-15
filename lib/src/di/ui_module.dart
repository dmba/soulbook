import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiwi/kiwi.dart';
import 'package:soulbook/src/blocs/home/home.dart';
import 'package:soulbook/src/blocs/intro/intro.dart';
import 'package:soulbook/src/blocs/login/login.dart';
import 'package:soulbook/src/di/module.dart';
import 'package:soulbook/src/pages/detail/detail.dart';
import 'package:soulbook/src/pages/home/home.dart';
import 'package:soulbook/src/pages/intro/intro.dart';
import 'package:soulbook/src/pages/login/auth.dart';
import 'package:soulbook/src/pages/login/login.dart';
import 'package:soulbook/src/pages/splash/splash.dart';

part 'package:soulbook/src/di/ui_module.g.dart';

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
  @Register.factory(SplashPage)
  @Register.factory(DetailPage)
  void _configurePages();
}
