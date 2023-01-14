import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app/pages/homepage.dart';
import 'package:help_app/pages/login.dart';
import 'package:help_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HELPMATE',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MainPage()
      },
    );
  }
}
