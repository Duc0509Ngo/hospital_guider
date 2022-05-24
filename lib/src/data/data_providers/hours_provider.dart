import 'package:postgres/postgres.dart';

class AvailableHoursProvider {
  final conn = PostgreSQLConnection('localhost', 5432, 'hospitalUsers',
      username: 'postgres', password: 'narutocuuvi2002');
  Future<List<List>> getAvailableHours() async {
    await conn.open();
    List<List> hours = await conn.query('SELECT may FROM hours');
    return hours;
  }

  Future<void> deleteSelectedTime(String selectedTime) async {
    await conn.open();
    await conn.query('DELETE FROM hours WHERE may = @selectedtime',
        substitutionValues: {'selectedtime': selectedTime});
    
  }
}
