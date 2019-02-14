import 'package:core/src/blocs/auth/auth.dart';
import 'package:core/src/blocs/home/home.dart';
import 'package:core/src/blocs/intro/intro.dart';
import 'package:core/src/blocs/login/login.dart';
import 'package:core/src/di/module.dart';
import 'package:core/src/repo/user_repo.dart';
import 'package:kiwi/kiwi.dart';

part 'package:core/src/di/core_module.g.dart';

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
