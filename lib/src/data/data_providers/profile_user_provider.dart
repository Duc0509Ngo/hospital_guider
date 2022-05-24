import 'package:postgres/postgres.dart';

class UserProvider {
  final conn = PostgreSQLConnection('localhost', 5432, 'hospitalUsers',
      username: 'postgres', password: 'narutocuuvi2002');
  Future<void> addUser(String name, String phoneNumber, String id, String email,
      String address, String date) async {
    await conn.open();
    List<List> user = await conn
        .query('''INSERT INTO users (name,id,phonenumber,email,address,date) VALUES (@name,@id,@phonenumber,@email,@address,@date)''',
            substitutionValues: {
          'name': name,
          'phonenumber': phoneNumber,
          'id': id,
          'email': email,
          'address': address,
          'date': date
        });
  }

  Future<List<List>> getUser() async {
    await conn.open();
    List<List> user = await conn.query('''SELECT * FROM users''');

    return user;
  }
}
