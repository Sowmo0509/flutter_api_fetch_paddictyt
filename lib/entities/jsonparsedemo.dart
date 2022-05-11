import 'package:flutter/material.dart';
import 'package:flutter_api_fetch_paddictyt/entities/services.dart';
import 'package:flutter_api_fetch_paddictyt/entities/users.dart';

class JsonParseDemon extends StatefulWidget {
  const JsonParseDemon({Key? key}) : super(key: key);

  @override
  State<JsonParseDemon> createState() => _JsonParseDemonState();
}

class _JsonParseDemonState extends State<JsonParseDemon> {
  late List<Users> users;
  late bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    Services.getUsers().then((value) {
      users = value;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(loading ? 'Loading' : 'Users')),
      body: Container(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              Users user = users[index];
              return ListTile(
                title: Text('${user.name}  ${user.id}'),
                subtitle: Text(user.email),
              );
            }),
      ),
    );
  }
}
