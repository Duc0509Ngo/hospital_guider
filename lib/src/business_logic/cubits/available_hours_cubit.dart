import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_guider/src/data/repositories/repository.dart';

class AvailableHoursCubit extends Cubit<List<List>> {
  final Repository repository;
  AvailableHoursCubit(this.repository) : super([]);

  void getAvailableRegisterHours() async {
    final List<List> hours = await repository.getAvailableTime();
    emit(hours);
  }
}
