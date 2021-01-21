part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();
  
  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {}
