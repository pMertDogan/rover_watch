import 'package:get_it/get_it.dart';
import 'package:rover_watch/data/base/authBase.dart';
import 'package:rover_watch/data/services/FirabaseAuth.dart';
import 'package:rover_watch/state/galleryVM.dart';
import 'package:rover_watch/state/userVM.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() {
  //Create firebase auth service
  getIt.registerSingleton<AuthBase>(FirebaseAuthService());
  //Create UserVievModel using selected AuthService
  getIt.registerSingleton<UserVM>(UserVM(getIt<AuthBase>()));
  getIt.registerSingleton<GalleryVM>(GalleryVM());

}