part of 'auth_state_bloc.dart';

abstract class AuthStateEvent extends Equatable {
  const AuthStateEvent();
}

class InitGetUser extends AuthStateEvent{
  @override
  List<Object> get props =>[];
}

class Logout extends AuthStateEvent{
  @override
  List<Object> get props =>[];
}

class LoginWithFacebook extends AuthStateEvent{
  @override
  List<Object> get props =>[];
}