import 'package:postgres/postgres.dart';

class STTProvider {
  final conn = PostgreSQLConnection('localhost', 5432, 'hospitalUsers',
      username: 'postgres', password: 'narutocuuvi2002');
  Future<List<List>> getSTT() async {
    await conn.open();
    List<List> stt = await conn.query('SELECT id FROM stt');
    return stt;
  }

  Future<void> updateSTT(int currentSTT) async {
    await conn.open();
    await conn.query('UPDATE stt SET id=@currentSTT',
        substitutionValues: {'currentSTT': currentSTT});
  }
}
