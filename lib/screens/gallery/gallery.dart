import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/screens/gallery/bottomRoverSelect.dart';
import 'package:rover_watch/screens/gallery/filterComponents.dart';
import 'package:rover_watch/screens/gallery/topPanel.dart';
import 'package:rover_watch/screens/gallery/roverPhotoGallery.dart';
import 'package:rover_watch/state/userVM.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Consumer<UserVM>(
            builder: (context, userVM, child) => Column(
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

