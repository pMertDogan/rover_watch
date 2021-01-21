import 'package:bloc/bloc.dart';
import 'package:rover_watch/config.dart';

class RoverCubit extends Cubit<RoverTypes> {
  RoverCubit() : super(RoverTypes.Curiosity);

  void selectRover(RoverTypes selected) => emit(selected);

}
