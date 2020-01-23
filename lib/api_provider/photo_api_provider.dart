import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:todo_poc/models/photo.dart';

class PhotoApiProvider {
  PhotoApiProvider({@required this.client});
  final Client client;

  Future<List<Photo>> getAllPhotos() async{
    var url = "https://jsonplaceholder.typicode.com/albums/1/photos";

    final response = await client.get(url);
    print("getAllPhotos => status code = ${response.statusCode}");

    if(response.statusCode == 200){
      final data = json.decode(response.body);
      List<Photo> photos = List<Photo>.from(data.map((i) => Photo.fromJson(i)));
      return photos;
    } else {
      print("getAllPhotos: failure => ${response.body}");
      return [];
    }
  }
}