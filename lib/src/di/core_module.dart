import 'package:mobile/src/blocs/auth/auth.dart';
import 'package:mobile/src/blocs/home/home.dart';
import 'package:mobile/src/blocs/intro/intro.dart';
import 'package:mobile/src/blocs/login/login.dart';
import 'package:mobile/src/di/module.dart';
import 'package:mobile/src/repo/user_repo.dart';
import 'package:kiwi/kiwi.dart';

part 'package:mobile/src/di/core_module.g.dart';

abstract class CoreModule implements Module {
  const CoreModule();

  factory CoreModule.create() => new _$CoreModule();

  @override
  void configure(Container container) {
    _configureRepos();
    _configureBlocs();
  }

  @Register.factory(CounterBloc)
  @Register.factory(IntroBloc)
  @Register.factory(LoginBloc)
  @Register.factory(AuthBloc)
  void _configureBlocs();

  @Register.factory(UserRepo)
  void _configureRepos();
}
