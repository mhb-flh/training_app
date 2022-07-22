import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'colors.dart' as color;
import 'main.dart';


class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List videoInfo = [];
  bool _playArea=false;
  VideoPlayerController? _controller;


  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/video.json").then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
      });

    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea==false?BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.8),
              color.AppColor.gradientSecond.withOpacity(0.9),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(5,10,),
              blurRadius: 10,
              color: color.AppColor.gradientSecond.withOpacity(0.2),
            ),
          ],
        ):
        BoxDecoration(
          color: color.AppColor.gradientSecond,
        ),
        child: Column(
          children: [
            //blue section
            _playArea==false?Container(
              padding: const EdgeInsets.only(top: 50 ,left: 30,right: 30),
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to(()=> MyHomePage(title: '',));
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size:20,
                        color: color.AppColor.secondPageIconColor),
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.info_outline,
                          size:20,
                          color: color.AppColor.secondPageIconColor),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("Legs Toning",
                    style: TextStyle(
                      fontSize: 23,
                      color: color.AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("and Glutes workout",
                    style: TextStyle(
                      fontSize: 23,
                      color: color.AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              color.AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2stColor,
                            ]
                          )
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(Icons.timer,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,),
                            SizedBox(width: 5,),
                            Text("20 min",
                              style: TextStyle(
                                fontSize: 14,
                                color: color.AppColor.homePageContainerTextSmall,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 30,
                        width: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  color.AppColor.secondPageContainerGradient1stColor,
                                  color.AppColor.secondPageContainerGradient2stColor,
                                ]
                            )
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(Icons.handyman_outlined,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,),
                            SizedBox(width: 5,),
                            Text("Resistant band ,Kettebell ",
                              style: TextStyle(
                                fontSize: 14,
                                color: color.AppColor.homePageContainerTextSmall,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ):
                //player section
            Container(
              child: Column(
                children: [
                  Container(
                    padding:const EdgeInsets.only(top: 50,right: 30,left: 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                          },
                          child: Icon(Icons.arrow_back_ios,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,),
                      ],
                    ),
                  ),
                  _playVideo(context),
                ],
              ),
            ),
            //white section
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight:Radius.circular(70)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(width:25,),
                      Text(
                        "crcuit 1: Legs Toning",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.circuitsColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(Icons.loop,size: 25,color: color.AppColor.loopColor,),
                          Text(
                            "3 sets",
                            style: TextStyle(
                              fontSize: 16,
                              color: color.AppColor.setColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 35,)
                    ],
                  ),
                  Expanded(child: _listView()),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  _listView(){
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        itemCount:videoInfo.length,
        itemBuilder: (_,int index){

          return GestureDetector(
            onTap: (){
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if(_playArea==false){
                  _playArea=true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }
  _buildCard(int index){
    return Container(
      height: 120,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        videoInfo[index]['thumbnail'],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoInfo[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        videoInfo[index]['time'],
                        style: TextStyle(
                            color: Colors.grey[500]
                        ),
                      ),

                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: color.AppColor.restColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(
                      color: color.AppColor.gradientSecond,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for(int i=1;i< 85 ;i++)
                    i.isEven?Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                        color: color.AppColor.loopColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ):Container(
                      width: 3,
                      height: 1,
                    ),
                ],
              )
            ],
          ),
        ],
      ),

    );
  }

  void _onTapVideo(int index) {
     final controller=VideoPlayerController.network(videoInfo[index]["Url"]);
    _controller=_controller;
    setState(() {

    });
    controller..initialize().then((_) {
      controller.play();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget _playVideo(BuildContext context){
    final controller=_controller;
    if(controller!=null&&controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 16/9,
        child: VideoPlayer(controller),
      );
    }else{
      return AspectRatio(
          aspectRatio:16/9,
          child: Center(
              child: Text("preparing ..."),
          ),
      );
    }
  }
}
