import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  String userName;
  String pictureURL;
  String email;
  String refreshToken;

  @override
  String toString() {
    return 'AppUser{userName: $userName, pictureURL: $pictureURL, email: $email}';
  }

  @override
  //Değişen User'ı algılaması için
  List<Object> get props => [userName, pictureURL, email, refreshToken];
}
