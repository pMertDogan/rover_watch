import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/state/userVM.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserVM>(
      builder: (context, userVM, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userVM.user.pictureURL),
          ),
          Text(
            "Hello, " +
                (userVM.user.userName ?? "error") +
                "\n" +
                (userVM.user.email ?? "email error"),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
              icon: Icon(Icons.exit_to_app), onPressed: () => userVM.singOut())
        ]),
      ),
    );
  }
}
