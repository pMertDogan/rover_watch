import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/getIT.dart';
import 'package:rover_watch/screens/gallery.dart';
import 'package:rover_watch/screens/loginScreen.dart';
import 'package:rover_watch/state/galleryVM.dart';
import 'package:rover_watch/state/userVM.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getItSetup();
  final getIt = GetIt.instance;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserVM>(create: (context) => getIt<UserVM>()),
        ChangeNotifierProvider<GalleryVM>(create: (context) => getIt<GalleryVM>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<UserVM>(builder: (context, userVM, child) {
        return userVM.user == null?  LoginScreen() : GalleryScreen();
      },),
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

