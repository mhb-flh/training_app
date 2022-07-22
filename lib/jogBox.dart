import 'package:flutter/material.dart';
import 'colors.dart' as color;

class jogBox extends StatelessWidget {
  const jogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child:Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30,),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              // image: DecorationImage(
              //   image: AssetImage(
              //     "assets/card3.png"
              //   ),
              //   fit: BoxFit.fill,
              //   colorFilter: null,
              // ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: Offset(1,3,),
                  color: color.AppColor.gradientSecond.withOpacity(0.3),
                ),
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0,-1,),
                  color: color.AppColor.gradientSecond.withOpacity(0.3),
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 30,right: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                    "assets/jogging.png"
                ),
              ),
            ),
          ),
          Container(

            width: double.maxFinite,
            height: 100,
            margin: const EdgeInsets.only(left: 140,top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You are doing great!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                SizedBox(height: 10,),

                RichText(text:TextSpan(
                    text: "keep it up \n",
                    style: TextStyle(
                      fontSize: 15,
                      color: color.AppColor.homePagePlanColor,
                    ),
                    children: [
                      TextSpan(
                        text: "stick to your plan ",
                      )
                    ]
                ),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
