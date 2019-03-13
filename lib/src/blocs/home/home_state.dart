import 'package:meta/meta.dart';

class CounterState {
  final int value;

  const CounterState({@required this.value});

  factory CounterState.initial() {
    return CounterState(
      value: 0,
    );
  }
}
