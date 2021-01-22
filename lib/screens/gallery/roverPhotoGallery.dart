import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rover_watch/data/models/roverPhotos.dart';
import 'package:rover_watch/state/photos/photos_bloc.dart';

class RoverPhotoGallery extends StatelessWidget {
  const RoverPhotoGallery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<PhotosBloc, PhotosState>(
      builder: (context, state) {
        if (state is PhotosError) {
          return Center(child: Text(state.mesaj));
        } else if (state is PhotosLoaded) {
          return GridView.count(
              crossAxisCount: 2,
              children: List.generate(state.roverPhotos.photos.length, (index) {
                Photo currentPhoto = state.roverPhotos.photos[index];
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
              }));
        } else
          return CircularProgressIndicator();
      },
    ));
  }
}
