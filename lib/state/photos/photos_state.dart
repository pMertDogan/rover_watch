part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();
  
  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {}
class PhotosLoading extends PhotosState {}
class PhotosError extends PhotosState{
  final String mesaj;

  PhotosError(this.mesaj);
}


class PhotosLoaded extends PhotosState{
  final RoverPhotos roverPhotos;
  

  PhotosLoaded(this.roverPhotos);
}
