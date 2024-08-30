import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:quotes/Screens/HomeScreen/View/Home_Page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () => Get.offAll(HomePage()),);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Color(0xff12213C),
        alignment: Alignment.center,
        child:Container(
          width: 200,
          height: 200,
          child: Lottie.network(
              'https://lottie.host/7bd1de96-c54f-4e76-8e76-0590e67dba26/YXpB0dfVg2.json',width: 500,height: 500,),
        ),
      ),
    );
  }
}
