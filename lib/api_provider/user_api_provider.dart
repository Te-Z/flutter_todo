import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:todo_poc/models/user.dart';

class UserApiProvider {
  UserApiProvider({@required this.client});
  final Client client;

  Future<List<User>> getAllUsers() async{
    var url = "https://api.github.com/users";

    final response = await client.get(url);
    print("getAllUsers => status code = ${response.statusCode}");

    if(response.statusCode == 200){
      final data = json.decode(response.body);
      List<User> users = List<User>.from(data.map((i) => User.fromJson(i)));
      return users;
    } else {
      print("getAllUsers: failure => ${response.body}");
      return [];
    }
  }
}