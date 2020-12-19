import 'package:flutter/material.dart';
import 'package:rover_watch/data/base/authBase.dart';
import 'package:rover_watch/data/models/AppUser.dart';

class UserVM extends ChangeNotifier{

  AppUser _user;
  AuthBase authService;


  AppUser get user => _user;

  set user(AppUser value) {
    _user = value;
    notifyListeners();
  }

  UserVM(this.authService){
    print(authService == null ? "authService Empty ":"userVM creted with authservice");
    getCurrentUser();
    print("userVM creted" + user.toString());
  }

  void getCurrentUser()  {
    user =  authService.currentUser();
    print(user == null ? "user is empty" : "user filled");
  }

  void singOut(){
    authService.singOut();
    user = null;
  }

  Future<void> singInWithFacebook() async {
    user = await authService.singInWithFacebook();

  }
}