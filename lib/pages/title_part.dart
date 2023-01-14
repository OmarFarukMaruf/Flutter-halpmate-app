import 'dart:ffi';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_app/pages/blood.dart';
import 'package:help_app/utils/dymentions.dart';
import 'package:help_app/widgets/big_text.dart';
import 'package:get/get.dart';

import 'ambulance.dart';

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
          margin: EdgeInsets.only(top: 20),
          height: Dymentions.container1,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        SizedBox(
          height: Dymentions.sizeBox20,
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: Colors.redAccent,
          ),
        ),

        SizedBox(
          height: Dymentions.sizeBox20,
        ),

        // 2nd Part of home page
        Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
          height: Dymentions.container2,
          child: ListView(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent),
                      height: Dymentions.iconPaddingHight,
                      width: Dymentions.iconPaddingwidth,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Ambulance()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.emergency,
                              size: 40,
                            ), // <-- Icon
                            Text("Ambulance",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)), // <-- Text
                          ],
                        ),
                      ),
                    ),

                    //SizedBox(width: 50),

                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent),
                      height: Dymentions.iconPaddingHight,
                      width: Dymentions.iconPaddingwidth,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.local_police_outlined,
                              size: 40,
                            ), // <-- Icon
                            Text("Call Police",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)), // <-- Text
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(width: 40),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orangeAccent),
                      height: Dymentions.iconPaddingHight,
                      width: Dymentions.iconPaddingwidth,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.local_fire_department,
                              size: 40,
                            ), // <-- Icon
                            Text(
                              "Fire Service",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dymentions.sizeBox20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 169, 254, 211)),
                      height: Dymentions.iconPaddingHight,
                      width: Dymentions.iconPaddingwidth,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BloodBank()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.bloodtype,
                              size: 50,
                              color: Colors.red,
                            ), // <-- Icon
                            Text(
                              "Blood Donor",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ), // <-- Text
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(width: 50),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 199, 237, 255)),
                      height: Dymentions.iconPaddingHight,
                      width: Dymentions.iconPaddingwidth,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.medication,
                              size: 50,
                              color: Colors.red,
                            ), // <-- Icon
                            Text("Medicine"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(width: 50),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent),
                      height: Dymentions.iconPaddingHight,
                      width: Dymentions.iconPaddingwidth,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.help_center,
                              size: 50,
                            ), // <-- Icon
                            Text("Help"), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ]),
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
          height: Dymentions.containerFT,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellow,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/999.jpg"))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dymentions.containerST,
            margin: EdgeInsets.only(right: 20, left: 20, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 161, 202, 78),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 10.0)
                ]),
            child: InkWell(
              splashColor: Colors.green,
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.call,
                    size: 50,
                  ), // <-- Icon
                  Text(
                    "999",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ), // <-- Text
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
