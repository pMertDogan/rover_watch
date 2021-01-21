part of 'auth_state_bloc.dart';

abstract class AuthStateState extends Equatable {
  const AuthStateState();
}

class AuthStateInitial extends AuthStateState {
  @override
  List<Object> get props => [];
}
