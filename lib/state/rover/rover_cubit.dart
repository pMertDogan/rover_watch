import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rover_state.dart';

class RoverCubit extends Cubit<RoverState> {
  RoverCubit() : super(RoverInitial());
}
