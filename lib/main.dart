import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rover_watch/screens/loginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {

          // Check for errors
          if (snapshot.hasError) {
            return SomethingWentWrong();
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            final FirebaseAuth auth = FirebaseAuth.instance;
            auth.authStateChanges()
                .listen((User user) {
              if (user == null) {
                print('User is currently signed out!');
              } else {
                print('User is signed in!');
              }
            });
            return LoginScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Loading();
        },
      ),
    );
  }
}


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text("Malesef bir hata meydana geldi"),
        ),
      ),
    );
  }
}

