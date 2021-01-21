import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cam_filter_state.dart';

class CamFilterCubit extends Cubit<CamFilterState> {
  CamFilterCubit() : super(CamFilterInitial());
}
