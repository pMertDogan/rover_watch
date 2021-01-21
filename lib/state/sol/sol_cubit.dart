import 'package:bloc/bloc.dart';

class SolCubit extends Cubit<int> {
  SolCubit() : super(999);

  void solGuncellendi(int guncellenenDeger) => emit(guncellenenDeger);
}
