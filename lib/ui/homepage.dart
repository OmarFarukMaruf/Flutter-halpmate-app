import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_app/ui/title_part.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GET HELP',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_rounded))
        ],
      ),
      drawer: Drawer(
        child: ListView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
        ],
      ),
      body: Column(
        children: [
          PageTitle()
          ],
      ),
    );
  }
}
