part of 'auth_state_bloc.dart';

abstract class AuthStateState extends Equatable {
  const AuthStateState();
}

class AuthStateInitial extends AuthStateState {
  @override
  List<Object> get props => [];
}

class AuthStateLogged extends AuthStateState {
  final AppUser appUser;

  AuthStateLogged(this.appUser);

  @override
  List<Object> get props => [appUser];
}

class AuthStateLoggedOut extends AuthStateState {
  @override
  List<Object> get props => [];
}

class AuthStateError extends AuthStateState {
  final String errorMsg;

  AuthStateError(this.errorMsg);

  @override
  List<Object> get props => [];
}

class AuthStateLoading extends AuthStateState {
  @override
  List<Object> get props => [];
}