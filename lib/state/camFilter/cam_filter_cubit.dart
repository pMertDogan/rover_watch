import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rover_watch/config.dart';
import 'package:rover_watch/state/rover/rover_cubit.dart';

part 'cam_filter_state.dart';

class CamFilterCubit extends Cubit<CamFilterState> {

  final RoverCubit roverCubit;
  StreamSubscription streamSubscription;

  CamFilterCubit(this.roverCubit) : super(CamFilterInitial()) {
    //rover değişince cam listesinide değiştir
    streamSubscription = roverCubit.listen((roverState) {
      roverTypeToState(roverState);
    });
    //Şuanki kamera listeseni defaut cam a göre ayarla ilk açılışta
    roverTypeToState(roverCubit.state);
  }



  void roverTypeToState(RoverTypes roverType){
    switch (roverType) {
      case RoverTypes.Curiosity:
        changeCamFilterList(RoverAppConfig.curiosityCameras);
        break;
      case RoverTypes.Opportunity:
      case RoverTypes.Spirit:
        changeCamFilterList(RoverAppConfig.opportunitySpiritCameras);
        break;
    }

  }

  void changeCamFilterList(List<String> listOfOptions) =>
      emit(UpdatedCamFilter("all", listOfOptions));

  //Mevcut halinden yeni bir nesne üret böylece fark edilsin :)
  void updateCamSelection(String selectedCam) =>
      emit((state as UpdatedCamFilter).copyWith(selected: selectedCam));

  @override
  Future<void> close() {
    // Kapatılmazsa memory leak olur ama diyeyim :)
    streamSubscription.cancel();
    return super.close();
  }

}
