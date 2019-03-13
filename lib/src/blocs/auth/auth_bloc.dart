import 'package:bloc/bloc.dart';
import 'package:soulbook/src/blocs/auth/auth.dart';
import 'package:soulbook/src/repo/user_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._userRepo);

  final UserRepo _userRepo;

  @override
  AuthState get initialState => AuthState.UNINITIALIZED;

  @override
  Stream<AuthState> mapEventToState(
    AuthState currentState,
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await _userRepo.hasToken();

      if (hasToken) {
        yield AuthState.AUTHENTICATED;
      } else {
        yield AuthState.UNAUTHENTICATED;
      }
    }

    if (event is LoggedIn) {
      yield AuthState.LOADING;
      await _userRepo.persistToken(event.token);
      yield AuthState.AUTHENTICATED;
    }

    if (event is LoggedOut) {
      yield AuthState.LOADING;
      await _userRepo.deleteToken();
      yield AuthState.UNAUTHENTICATED;
    }
  }

  void dispatchAppStart() {
    dispatch(AppStarted());
  }
}
