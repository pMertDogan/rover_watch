class AppUser{

  String userName;
  String pictureURL;
  String email;
  String refreshToken;

  @override
  String toString() {
    return 'AppUser{userName: $userName, pictureURL: $pictureURL, email: $email}';
  }
}