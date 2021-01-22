part of 'photos_bloc.dart';

abstract class PhotosEvent extends Equatable {
  const PhotosEvent();

  @override
  List<Object> get props => [];
}

class GetPhotos extends PhotosEvent {

  final String selectedCam;
  final String roverName;
  final String sol;
  
  GetPhotos(this.selectedCam, this.roverName, this.sol);

  
  GetPhotos copyWith({
    String selectedCam,
    String roverName,
    String sol,
  }) {
    return GetPhotos(
      selectedCam ?? this.selectedCam,
      roverName ?? this.roverName,
      sol ?? this.sol,
    );
  }
}

