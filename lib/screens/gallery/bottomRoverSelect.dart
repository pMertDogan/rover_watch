import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/state/galleryVM.dart';

class BottomRoverSelect extends StatelessWidget {
  const BottomRoverSelect({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryVM>(
      builder: (context, galleryVM, child) {
        return BottomNavigationBar(
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
          currentIndex: galleryVM.selectedRoverIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            //to fix dropdown box error
            galleryVM.selectedCamAPIName="all";
            return galleryVM.updateSelectedRover(index);
          },
        );
      },
    );
  }
}
