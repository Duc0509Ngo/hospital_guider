import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_guider/src/data/repositories/repository.dart';


class STTCubit extends Cubit<int> {
  final Repository repository;
 
  STTCubit(this.repository) : super(0);
  void generateNo() async {
    List<List> no = await repository.getNo();
    emit(no[0][0] + 1);
  }
}
