import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/state/galleryVM.dart';
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
                topPanel(userVM),
                SingleChildScrollView(child: Row(),),
                //Text(userVM.user.toString()),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                            color: Colors.green,
                            child: new Center(
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                child: new Text('$index'),
                              ),
                            )),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
                BottomRoverSelect(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topPanel(UserVM userVM) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userVM.user.pictureURL),
        ),
        Text(
          "Hello, " + (userVM.user.userName ??
              "error" )+ "\n" + (userVM.user.email ??
              "email error"),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        IconButton(
            icon: Icon(Icons.exit_to_app), onPressed: () => userVM.singOut())
      ]),
    );
  }
}

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
              icon: Icon(CupertinoIcons.car),
              label: 'Curiosity',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.car),
              label: 'Opportunity',
            ),
            BottomNavigationBarItem(
              icon: Icon(AntDesign.car),
              label: 'Spirit',
            ),
          ],
          currentIndex: galleryVM.selectedRoverIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) => galleryVM.updateSelectedRover(index),
        );
      },
    );
  }
}
