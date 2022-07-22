import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/jogBox.dart';
import 'package:training_app/video_info.dart';
import 'package:training_app/workoutBox.dart';
import 'colors.dart' as color;
import 'workoutBox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ""),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = jsonDecode(value);
      });

    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 25,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Your programs",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: (){
                    Get.to(()=> VideoInfo());
                  },
                  child: Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 18,
                      color: color.AppColor.homePageDetail,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: (){
                    Get.to(()=> VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            workoutBox(),
            //second box
            jogBox(),
            Row(
              children: [
                Text(
                  "Area offocus",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            Expanded(
              child:MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: (info.length.toDouble()/2).toInt(),
                      itemBuilder: (_, i) {
                        int a=2*i;
                        int b=2*i+1;
                        return Row(
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 165,
                                    height: 180,
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(
                                              4,
                                              4,
                                            ),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(
                                              -4,
                                              -4,
                                            ),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                      ],
                                    ),
                                    child: Center(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            info[b]['title'],
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: color.AppColor.homePageDetail,
                                            ),
                                          ),
                                        )),
                                  ),
                                  Container(
                                    width: 140,
                                    height: 130,
                                    margin: const EdgeInsets.all(20),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            info[b]['img']
                                          //"assets/leg.png"),
                                          //alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 165,
                                    height: 180,
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(
                                              4,
                                              4,
                                            ),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(
                                              -4,
                                              -4,
                                            ),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                      ],
                                    ),
                                    child: Center(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            info[a]['title'],
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: color.AppColor.homePageDetail,
                                            ),
                                          ),
                                        )),
                                  ),
                                  Container(
                                    width: 140,
                                    height: 130,
                                    margin: const EdgeInsets.all(20),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            info[a]['img']
                                          //"assets/leg.png"),
                                          //alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }))
                ),
          ],
        ),
      ),
    );
  }
}
