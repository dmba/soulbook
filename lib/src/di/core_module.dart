import 'package:soulbook/src/blocs/auth/auth.dart';
import 'package:soulbook/src/blocs/home/home.dart';
import 'package:soulbook/src/blocs/intro/intro.dart';
import 'package:soulbook/src/blocs/login/login.dart';
import 'package:soulbook/src/di/module.dart';
import 'package:soulbook/src/repo/user_repo.dart';
import 'package:kiwi/kiwi.dart';

part 'package:soulbook/src/di/core_module.g.dart';

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
