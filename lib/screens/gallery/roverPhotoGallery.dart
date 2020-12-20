import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/data/models/roverPhotos.dart';
import 'package:rover_watch/state/galleryVM.dart';

class RoverPhotoGallery extends StatelessWidget {
  const RoverPhotoGallery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryVM>(
      builder: (context, galleryVM, child) {
        return Expanded(
          child: FutureBuilder(
            future: galleryVM.getPhotos(),
            builder: (context, AsyncSnapshot<RoverPhotos> snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                if (snapshot.hasData) {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: snapshot.data.photos.length,
                    itemBuilder: (BuildContext context, int index) {
                      Photo currentPhoto = snapshot.data.photos[index];

                      return new Card(
                        child: new Column(
                          children: <Widget>[
                            Expanded(
                                child: new Image.network(
                                  currentPhoto.imgSrc,
                                  fit: BoxFit.fill,
                                )),
                            new Column(
                              children: <Widget>[
                                new Text(
                                  currentPhoto.camera.name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  Jiffy(currentPhoto.earthDate).yMMMEd,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, 2),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString().replaceAll("Exception:", "")));
                } else {
                  return Text("please wait");
                }
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
