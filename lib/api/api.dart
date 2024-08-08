import 'dart:convert';

import 'package:users_app/models/users.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Users>> getUsers() async {
    String url = "https://jsonplaceholder.typicode.com/users";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Users.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }
}
