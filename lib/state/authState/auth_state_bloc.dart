import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rover_watch/data/base/authBase.dart';
import 'package:rover_watch/data/models/appUser.dart';

part 'auth_state_event.dart';

part 'auth_state_state.dart';

class AuthStateBloc extends Bloc<AuthStateEvent, AuthStateState> {
  //Auth serivisini al
  final AuthBase _authService;

  AuthStateBloc(AuthBase authService)
      : assert(authService != null),
        this._authService = authService,
        super(AuthStateInitial());

  //Her bir event'in state olarak karşılğı olmalıdırır
  @override
  Stream<AuthStateState> mapEventToState(
    AuthStateEvent event,
  ) async* {
    print("şuanki event " + event.toString());
    if (event is InitGetUser) {
      yield* getCurrentUser();
    }
    if (event is LoginWithFacebook) {
      yield* facebookSingIn();
    }
    if (event is Logout) {
      yield* _logOut();
    }
  }

  //Mevcut kulllanıcı al
  Stream<AuthStateState> getCurrentUser() async* {
    yield AuthStateLoading();
    AppUser loggedUser = await _authService.currentUser();
    if (loggedUser == null) {
      yield AuthStateLoggedOut();
    } else {
      yield AuthStateLogged(loggedUser);
    }
  }

  Stream<AuthStateState> facebookSingIn() async* {
    print("facebook ile giriş yap");
    yield AuthStateLoading();
    AppUser loggedUser = await _authService.singInWithFacebook();
    if (loggedUser == null) {
      yield AuthStateLoggedOut();
    } else {
      yield AuthStateLogged(loggedUser);
    }
  }

  Stream<AuthStateState> _logOut() async* {
    print("mevcut hesaptan çıkış yap");
    yield AuthStateLoading();
    await _authService.singOut();
    yield AuthStateLoggedOut();
  }
}
