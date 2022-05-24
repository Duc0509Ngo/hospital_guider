import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedTimeCubit extends Cubit<String> {
  SelectedTimeCubit() : super('');
  void selectDate(String selectedTime) {
    emit(selectedTime);
  }
}
