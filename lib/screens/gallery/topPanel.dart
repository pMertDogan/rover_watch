import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/state/authState/auth_state_bloc.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthStateBloc, AuthStateState>(
      builder: (context, state) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CircleAvatar(
              backgroundImage: NetworkImage((state as AuthStateLogged).appUser.pictureURL),
            ),
            Text(
              "Hello, " +
                  ((state as AuthStateLogged).appUser.userName ?? "error") +
                  "\n" +
                  ((state as AuthStateLogged).appUser.email ?? "email error"),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: Icon(Icons.exit_to_app), onPressed: () => context.read<AuthStateBloc>().add(Logout()))
          ]),
      ),
    );
}
