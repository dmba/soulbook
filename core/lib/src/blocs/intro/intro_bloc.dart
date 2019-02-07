import 'package:bloc/bloc.dart';
import 'package:core/src/blocs/intro/intro.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  @override
  IntroState get initialState => IntroState.initial();

  @override
  Stream<IntroState> mapEventToState(
    IntroState currentState,
    IntroEvent event,
  ) async* {}
}
