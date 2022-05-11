import 'package:flutter_api_fetch_paddictyt/entities/users.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<Users>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<Users> users = usersFromJson(response.body);
        return users;
      } else {
        return List<Users>.empty();
      }
    } catch (e) {
      return List<Users>.empty();
    }
  }
}
