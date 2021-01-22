import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rover_watch/data/base/authBase.dart';
import 'package:rover_watch/data/services/FirabaseAuth.dart';
import 'package:rover_watch/screens/loginScreen.dart';
import 'package:rover_watch/state/authState/auth_state_bloc.dart';

import 'screens/gallery/gallery.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    RepositoryProvider<AuthBase>(
      create: (context) => FirebaseAuthService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthStateBloc(RepositoryProvider.of<AuthBase>(context))
                    //Git mevcut kullanıcı var mı yokmu öğren
                    ..add(InitGetUser()))
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStateBloc, AuthStateState>(
      builder: (context, AuthStateState state) {
        print(state);
        return MaterialApp(
          home: state is AuthStateInitial
              ? Loading()
              : state is AuthStateLoading
                  ? Loading()
                  : state is AuthStateError
                      ? SomethingWentWrong()
                      : state is AuthStateLogged
                          ? GalleryScreen()
                          : LoginScreen());
      },
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
