import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rover_watch/config.dart';
import 'package:rover_watch/screens/gallery/bottomRoverSelect.dart';
import 'package:rover_watch/screens/gallery/filterComponents.dart';
import 'package:rover_watch/screens/gallery/roverPhotoGallery.dart';
import 'package:rover_watch/screens/gallery/topPanel.dart';
import 'package:rover_watch/state/camFilter/cam_filter_cubit.dart';
import 'package:rover_watch/state/photos/photos_bloc.dart';
import 'package:rover_watch/state/rover/rover_cubit.dart';
import 'package:rover_watch/state/sol/sol_cubit.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RoverCubit()),
        BlocProvider(create: (context) => SolCubit()),
        BlocProvider(
            create: (context) => CamFilterCubit(context.read<RoverCubit>())),
        BlocProvider(
          create: (context) => PhotosBloc(context.read<CamFilterCubit>(),
              context.read<SolCubit>(), context.read<RoverCubit>())
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                TopPanel(),
                FilterComponents(),
                RoverPhotoGallery(),
                BottomRoverSelect(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
