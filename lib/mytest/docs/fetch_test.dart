import 'package:flutter/material.dart';
import 'package:flutter_api_fetch_paddictyt/mytest/docs/album.dart';
import 'package:flutter_api_fetch_paddictyt/mytest/docs/backend.dart';
import 'package:http/http.dart' as http;

class FetchTest extends StatefulWidget {
  const FetchTest({Key? key}) : super(key: key);

  @override
  State<FetchTest> createState() => _FetchTestState();
}

class _FetchTestState extends State<FetchTest> {
  late List<Album> album;
  bool circular = true;

  getData() async {
    List<Album> temp = await fetchAlbum();
    setState(() {
      album = temp;
      circular = false;
    });
    print(album.toString());
    return album;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: circular ? CircularProgressIndicator() : Text(album[1].title),
      ),
    );
  }
}
