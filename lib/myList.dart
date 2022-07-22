import 'dart:convert';

import 'package:flutter/material.dart';
import 'colors.dart' as color;

class myList extends StatefulWidget {
  const myList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: 180,
            height: 180,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(4, 4,),
                    color: color.AppColor.gradientSecond
                        .withOpacity(0.1)),
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(-4, -4,),
                    color: color.AppColor.gradientSecond
                        .withOpacity(0.1)),
              ],
            ),
            child: Center(
                child:Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Leg",
                    style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageDetail,
                    ),
                  ),
                )

            ),
          ),
          Container(
            width: 150,
            height: 130,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                    "assets/leg.png"
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
