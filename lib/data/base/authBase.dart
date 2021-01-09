

import 'package:rover_watch/data/models/appUser.dart';

abstract class AuthBase{
  AppUser currentUser();
  Future<AppUser> singInWithFacebook();
  Future<void> singOut();
}