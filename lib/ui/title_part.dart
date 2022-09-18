import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_app/widgets/big_text.dart';

class PageTitle extends StatefulWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  State<PageTitle> createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 250,
    child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        }),
      );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children  : [
      Container(
        height: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/image/amb.png"))),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 161, 202, 78),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 5),
                  blurRadius: 10.0

                )
              ]

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Call: 999", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),),
              ],
            ),
        ),
      ),
    ]
    );
  }
}
