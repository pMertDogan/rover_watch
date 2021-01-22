import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rover_watch/config.dart';
import 'package:rover_watch/data/models/roverPhotos.dart';
import 'package:rover_watch/state/camFilter/cam_filter_cubit.dart';
import 'package:rover_watch/state/rover/rover_cubit.dart';
import 'package:rover_watch/state/sol/sol_cubit.dart';

part 'photos_event.dart';

part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final CamFilterCubit camFilterCubit;
  final SolCubit solCubit;
  final RoverCubit roverCubit;
  StreamSubscription streamSubscriptionCam;
  StreamSubscription streamSubscriptionSol;
  StreamSubscription streamSubscriptionRover;
  String roverName;
  String selectedCam;
  String sol;

  PhotosBloc(this.camFilterCubit, this.solCubit, this.roverCubit)
      : super(PhotosInitial()) {
    initialGetPhotosByDepency();
    getPhotosWhenCamChanged();
    getPhotoWhenSolChanged();
    getPhotoWhenRoverChanged();
  }

  StreamSubscription<RoverTypes> getPhotoWhenRoverChanged() {
    return streamSubscriptionRover = roverCubit.listen((roverState) {
    switch (roverCubit.state) {
      case RoverTypes.Curiosity:
        roverName = "Curiosity";
        break;
      case RoverTypes.Opportunity:
        roverName = "Opportunity";
        break;
      case RoverTypes.Spirit:
        roverName = "Spirit";
        break;
    }
    add(GetPhotos(selectedCam, roverName, sol));
  });
  }

  void getPhotoWhenSolChanged() {
    streamSubscriptionCam = solCubit.listen((solState) {
      add(GetPhotos(selectedCam, roverName, solState.toString()));
    });
  }

  void getPhotosWhenCamChanged() {
    streamSubscriptionCam = camFilterCubit.listen((camState) {
      
      if (camState is UpdatedCamFilter) {
        selectedCam = camState.selected;
        add(GetPhotos(selectedCam, roverName, sol));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscriptionCam?.cancel();
    streamSubscriptionSol?.cancel();
    streamSubscriptionRover?.cancel();
    return super.close();
  }

  void initialGetPhotosByDepency() {
    selectedCam = camFilterCubit.state is UpdatedCamFilter
        ? (camFilterCubit.state as UpdatedCamFilter).selected
        : "all";

    switch (roverCubit.state) {
      case RoverTypes.Curiosity:
        roverName = "Curiosity";
        break;
      case RoverTypes.Opportunity:
        roverName = "Opportunity";
        break;
      case RoverTypes.Spirit:
        roverName = "Spirit";
        break;
    }

    sol = solCubit.state.toString();

    add(GetPhotos(selectedCam, roverName, sol));
  }

  @override
  Stream<PhotosState> mapEventToState(
    PhotosEvent event,
  ) async* {
    if (event is GetPhotos) {
      yield* _getPhotosFromApi(event);
    }
  }

  Stream<PhotosState> _getPhotosFromApi(event) async* {
    yield PhotosLoading();
    String url = endPoint +
        event.roverName +
        fixQuery +
        "&sol=" +
        event.sol +
        (event.selectedCam == "all" ? "" : "&camera=" + event.selectedCam);

    print(url);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
     // print(jsonResponse);
     // print((jsonResponse["photos"] as List).length == 0);
      if ((jsonResponse["photos"] as List).length == 0) {
        yield PhotosError(
          "Girdiğiniz kriterlere uygun bir sonuç bulunamadı :/");
    
      }else{

      
      //print(jsonResponse["photos"]);
      yield PhotosLoaded(RoverPhotos.fromJson(jsonResponse));
      }
    } else {
      yield PhotosError(
          "hata meydana geldi statusCode: " + response.statusCode.toString());
    }
  }
}
