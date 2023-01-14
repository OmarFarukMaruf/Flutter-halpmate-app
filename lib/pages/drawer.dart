import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue,
      child: ListView(children: [
        UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text("Omar Faruk"),
            accountEmail: Text("omarfaruk4543@gmail.com"))
      ]),
    );
  }
}
