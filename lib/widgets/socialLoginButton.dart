import 'package:flutter/material.dart';

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