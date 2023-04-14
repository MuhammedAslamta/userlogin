
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screen/homeScreen.dart';
import 'modelClass.dart';

class MainScreenApp extends StatefulWidget {
  @override
  _MainScreenAppState createState() => _MainScreenAppState();
}

class _MainScreenAppState extends State<MainScreenApp> {
  List<User> users = [];

  Future<void> fetchUsers() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        users = jsonResponse.map((user) => User.fromJson(user)).toList();
      });
    } else {
      throw Exception('Failed to load users from API');
    }
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        id: users[index].id.toString(),
                        name: users[index].name.toString(),
                        email: users[index].email.toString(),
                      )));
            },
            title: Text(users[index].name ?? "f"),
            subtitle: Text(users[index].email ?? "k"),
            leading: CircleAvatar(
              child: Text(users[index].id.toString()),
            ),
          );
        },
      ),
    );
  }
}
