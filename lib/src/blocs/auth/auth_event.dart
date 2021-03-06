import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  LoggedIn({@required this.token}) : super([token]);

  final String token;
}

class LoggedOut extends AuthEvent {}
