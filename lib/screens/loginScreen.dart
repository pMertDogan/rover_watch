import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/state/userVM.dart';
import 'package:rover_watch/widgets/socialLoginButton.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 30,),
              LoginLogo(),
              FacebookLogin(),
              GoogleLogin(),
              SizedBox(height: 5),
              SingUpEmail(),
              BottomPanel(),
            ],
          ),
        ),
      ),
    );
  }
}

class SingUpEmail extends StatelessWidget {
  const SingUpEmail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      color: Color.fromARGB(255, 96, 134, 230),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Singup with Email",
          style: TextStyle(fontSize: 18),
        ),
      ),
      onPressed: () {},
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
    );
  }
}

class BottomPanel extends StatelessWidget {
  const BottomPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text(
            "Existing user?",
            style: TextStyle(color: Color.fromARGB(255, 205, 208, 211)),
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Login Now",
            style: TextStyle(
              color: Color.fromARGB(255, 171, 178, 182),
            ),
          ),
        ),
      ],
    );
  }
}

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialLoginButton(
      onPressed: () => print("Google"),
      logoColor: null,
      icon: FontAwesome5Brands.google,
      buttonText: "Continue with Google",
      imagePath: "assets/google.png",
    );
  }
}

class FacebookLogin extends StatelessWidget {
  const FacebookLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserVM>(
        builder: (context, userVM, child) => SocialLoginButton(
              onPressed: () {
                print("Facebook");
                userVM.singInWithFacebook();
              },
              logoColor: Colors.blue,
              icon: FontAwesome.facebook,
              buttonText: "Continue with Facebook",
              imagePath: "assets/facebook.png",
            ));
  }
}

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Image.asset(
        "assets/login.png",
        width: 270,
        //fit: BoxFit.fill,
        //width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
