import 'dart:ffi';

import 'package:dots_indicator/dots_indicator.dart';
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
  var _currPageValue = 0.0;
  double _scalFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //First part tittle container
        Container(
          height: 250,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: Colors.redAccent,
          ),
        ),
// for gap between two container
        SizedBox(
          height: 80,
        ),

        // 2nd Part of home page
        Container(
          height: 300,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent),
                      height: 80,
                      width: 70,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              size: 50,
                            ), // <-- Icon
                            Text("Buy"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),

                  //SizedBox(width: 50),

                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent),
                      height: 80,
                      width: 70,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              size: 50,
                            ), // <-- Icon
                            Text("Buy"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(width: 40),
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent),
                      height: 80,
                      width: 70,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              size: 50,
                            ), // <-- Icon
                            Text(
                              "Buy",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //SizedBox(height: 60),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent),
                      height: 80,
                      width: 70,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              size: 50,
                            ), // <-- Icon
                            Text("Buy"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(width: 50),
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent),
                      height: 80,
                      width: 70,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              size: 50,
                            ), // <-- Icon
                            Text("Buy"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(width: 50),
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent),
                      height: 80,
                      width: 70,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              size: 50,
                            ), // <-- Icon
                            Text("Buy"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scalFactor);
      var currTranse = 200 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranse, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scalFactor + (_currPageValue - index + 1) * (1 - _scalFactor);
      var currTranse = 200 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranse, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scalFactor);
      var currTranse = 200 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranse, 0);
    } else {
      var currScale = 0.8;
      var currTranse = 200 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranse, 0);
    }
    //else if(){};
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellow,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/amb.png"))),
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
                      blurRadius: 10.0)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Call: 999",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
