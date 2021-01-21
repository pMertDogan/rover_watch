import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state_event.dart';
part 'auth_state_state.dart';

class AuthStateBloc extends Bloc<AuthStateEvent, AuthStateState> {
  AuthStateBloc() : super(AuthStateInitial());

  @override
  Stream<AuthStateState> mapEventToState(
    AuthStateEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
