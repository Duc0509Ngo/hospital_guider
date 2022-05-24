import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedDateCubit extends Cubit<String> {
  SelectedDateCubit() : super('');
  void selectDate(String selectedDate) {
    emit(selectedDate);
  }
}
