import 'package:bloc/bloc.dart';
import 'package:core/src/blocs/home/home.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(
    CounterState currentState,
    CounterEvent event,
  ) async* {
    if (event is Increment) {
      yield CounterState(value: currentState.value + 1);
    }
    if (event is Decrement) {
      yield CounterState(value: currentState.value - 1);
    }
  }

  void increment() => dispatch(Increment());

  void decrement() => dispatch(Decrement());
}
