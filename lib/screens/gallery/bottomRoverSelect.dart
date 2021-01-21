import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/config.dart';
import 'package:rover_watch/state/rover/rover_cubit.dart';

class BottomRoverSelect extends StatelessWidget {
  const BottomRoverSelect({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoverCubit, RoverTypes>(
        builder: (context, state) => BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(MaterialCommunityIcons.robot),
                  label: 'Curiosity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.robot_faw5s),
                  label: 'Opportunity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.robot_mco),
                  label: 'Spirit',
                ),
              ],
              currentIndex: state.index,
              selectedItemColor: Colors.amber[800],
              onTap: (index) {
                context.read<RoverCubit>().selectRover(RoverTypes.values[index]);
              },
            ));
  }
}
