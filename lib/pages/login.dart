import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String name = "";
  bool onTapp = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onTapp = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        onTapp = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              "Welcome $name",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty!";
                      }
                      if (value.length < 6) {
                        return "Passwoed lenth should be at least 6";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(onTapp ? 30 : 10),
              child: InkWell(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 40,
                    width: onTapp ? 40 : 130,
                    alignment: Alignment.center,
                    child: onTapp
                        ? Icon(
                            Icons.done,
                            color: Colors.green,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                  onTap: () => moveToHome(context)),
            ),
            SizedBox(height: 30),
            Text(
              textAlign: TextAlign.end,
              "If you don't have an account,",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
            Text(
              textAlign: TextAlign.end,
              "Please Sing Up",
              style: TextStyle(color: Colors.green, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
