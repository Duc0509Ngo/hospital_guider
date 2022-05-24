import 'package:hospital_guider/src/data/data_providers/hours_provider.dart';
import 'package:hospital_guider/src/data/data_providers/profile_user_provider.dart';
import 'package:hospital_guider/src/data/data_providers/stt_provider.dart';

class Repository {
  final AvailableHoursProvider _hoursRegisterProvider =
      AvailableHoursProvider();
  final STTProvider _noProvider = STTProvider();
  final UserProvider _userProvider = UserProvider();
  Future<List<List>> getAvailableTime() async {
    final List<List> time = await _hoursRegisterProvider.getAvailableHours();
    return time;
  }

  Future<List<List>> getNo() async {
    final List<List> no = await _noProvider.getSTT();
    return no;
  }

  Future<List<List>> getUser() async {
    final List<List> user = await _userProvider.getUser();
    return user;
  }
}
