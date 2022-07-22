import 'package:flutter/material.dart';
import 'colors.dart' as color;

class workoutBox extends StatelessWidget {
  const workoutBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.AppColor.gradientFirst.withOpacity(0.8),
            color.AppColor.gradientSecond.withOpacity(0.9),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(20),
          topRight:Radius.circular(80) ,
          bottomLeft:Radius.circular(20) ,
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(5,10,),
            blurRadius: 10,
            color: color.AppColor.gradientSecond.withOpacity(0.2),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("next workout",
              style: TextStyle(
                fontSize: 14,
                color: color.AppColor.homePageContainerTextSmall,
              ),
            ),
            SizedBox(height: 10,),
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
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
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
                Expanded(child: Container()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    boxShadow: [
                      BoxShadow(
                        color: color.AppColor.gradientFirst,
                        blurRadius: 12,
                        offset: Offset(3,6,),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
