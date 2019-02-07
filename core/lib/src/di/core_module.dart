import 'package:core/src/blocs/home/home.dart';
import 'package:core/src/di/module.dart';
import 'package:kiwi/kiwi.dart';

part 'package:core/src/di/core_module.g.dart';

abstract class CoreModule implements Module {
  const CoreModule();

  factory CoreModule.create() => new _$CoreModule();

  @override
  void configure(Container container) {
    _configureBlocs();
  }

  @Register.factory(CounterBloc)
  void _configureBlocs();
}
