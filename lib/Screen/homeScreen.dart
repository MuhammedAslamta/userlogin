import 'package:flutter/material.dart';

import '../main.dart';
import '../model_db/model_view.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreenApp()),
            ));
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen(
      {Key? key, required this.email, required this.name, required this.id})
      : super(key: key);
  String name;
  String email;
  String id;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    // child: ClipRRect(
                    // borderRadius: BorderRadius.circular(100),
                    // child: const Image(image: AssetImage("tProfileImage"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.amber),
                      child: const Icon(
                        Icons.abc,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(name, style: Theme.of(context).textTheme.headline4),
              Text(email, style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(id, style: TextStyle(color: Colors.amber)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// --
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  UserDetails(
      {Key? key, required this.name, required this.email, required this.id})
      : super(key: key);
  String name;
  String email;
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(email),
              Text(id),
              Container(
                child: Text(name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
