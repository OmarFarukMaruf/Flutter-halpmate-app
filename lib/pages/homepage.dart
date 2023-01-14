import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_app/pages/title_part.dart';
import 'drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    print("current height: " + MediaQuery.of(context).size.height.toString());
    print("current width: " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HelpMate',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_rounded))
        ],
      ),
      drawer: MyDrawer(),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [PageTitle()],
        ),
      ),
    );
  }
}
