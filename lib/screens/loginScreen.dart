
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.end,
            direction: Axis.vertical,
           runAlignment: WrapAlignment.center,
            spacing: 20,
            children: [
              SizedBox(height: 50,),
              Image.asset(
                "assets/login.png",
                //fit: BoxFit.fill,
                //width: MediaQuery.of(context).size.width,
              ),
              SocialLoginButton(
                onPressed: () {
                  print("Facebook");
                  signInWithFacebook();
                },
                logoColor: Colors.blue,
                icon: FontAwesome.facebook,
                buttonText: "Continue with Facebook",
              ),
              SocialLoginButton(
                onPressed: () => print("Google"),
                logoColor: null,
                icon: FontAwesome5Brands.google,
                buttonText: "Continue with Google",
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text("Existing user?",style: TextStyle(color: Color.fromARGB(255, 205 , 208, 211)),),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("Login Now",style: TextStyle(color: Color.fromARGB(255, 171, 178, 182),),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final AccessToken result = await FacebookAuth.instance.login();
  // Create a credential from the access token
  final FacebookAuthCredential facebookAuthCredential =
  FacebookAuthProvider.credential(result.token);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {Key key,
      @required this.onPressed,
      @required this.buttonText,
      @required this.icon,
      @required this.logoColor})
      : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final IconData icon;
  final MaterialColor logoColor;
  final textColor = const Color.fromARGB(255, 109, 110, 110);
  final double textSize = 20;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 21),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Color.fromARGB(255, 241, 243, 244),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: logoColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              buttonText,
              style: TextStyle(color: textColor, fontSize: textSize),
            )
          ],
        ),
      ),
    );
  }
}
