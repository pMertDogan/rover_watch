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
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.end,
            direction: Axis.vertical,
            runAlignment: WrapAlignment.center,
            spacing: 20,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/login.png",
                //fit: BoxFit.fill,
                //width: MediaQuery.of(context).size.width,
              ),
              Consumer<UserVM>(
                  builder: (context, userVM, child) => SocialLoginButton(
                        onPressed: () {
                          print("Facebook");
                          userVM.singInWithFacebook();
                        },
                        logoColor: Colors.blue,
                        icon: FontAwesome.facebook,
                        buttonText: "Continue with Facebook",
                      )),
              SocialLoginButton(
                onPressed: () => print("Google"),
                logoColor: null,
                icon: FontAwesome5Brands.google,
                buttonText: "Continue with Google",
              ),
              SizedBox(
                height: 5,
              ),
              emailSingup(),
              bottomLinks()
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton emailSingup() {
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

  Row bottomLinks() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Existing user?",
                    style:
                        TextStyle(color: Color.fromARGB(255, 205, 208, 211)),
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


