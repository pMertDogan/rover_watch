import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:rover_watch/data/base/authBase.dart';
import 'package:rover_watch/data/models/appUser.dart';

class FirebaseAuthService implements AuthBase{

  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseAuthService(){print("firebase auth created");}


  @override
  Future<AppUser> singInWithFacebook() async {

    try {



    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();
    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(result.token);
    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    return toAppUser(userCredential.user);
    } on FacebookAuthException catch (e) {
      print(e.message);
      print(e.errorCode);
    }
  }

  @override
  Future<void> singOut() {
    auth.signOut();
  }

  @override
  AppUser currentUser() {
    //Create empty app User

    return auth.currentUser == null ? null : toAppUser(auth.currentUser);
  }

  AppUser toAppUser(User user){
    AppUser appUser = AppUser();
    //Fill with values
    appUser.userName = auth.currentUser.displayName;
    appUser.pictureURL = auth.currentUser.photoURL;
    appUser.email = auth.currentUser.email;
    appUser.refreshToken = auth.currentUser.refreshToken;
    return appUser;
  }
}