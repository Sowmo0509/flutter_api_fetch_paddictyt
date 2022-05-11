import 'dart:convert';
import 'package:flutter_api_fetch_paddictyt/mytest/docs/album.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  String URL = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(Uri.parse(URL));

  if (response.statusCode == 200) {
    print(response.body);
    final json = jsonDecode(response.body) as List;
    List<Album> list = <Album>[];
    ;
    json.forEach((element) {
      list.add(Album.fromJson(element));
    });
    // return Album.fromJson(json);
    return list;
  } else {
    print('connection error');
  }

  return List<Album>.empty();
}
