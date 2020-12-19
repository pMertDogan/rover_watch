

import 'package:rover_watch/data/models/AppUser.dart';

abstract class AuthBase{
  AppUser currentUser();
  Future<AppUser> singInWithFacebook();
  Future<void> singOut();

}