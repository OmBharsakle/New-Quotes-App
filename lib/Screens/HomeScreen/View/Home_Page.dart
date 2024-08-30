import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quotes/Screens/MakeYourTheme/View/MakeTheme.dart';

import '../../../Utils/global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurpleAccent,
      backgroundColor: Color(0xff1A2946),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:Text(
            'Omg Quotes',
            style: TextStyle(
                fontFamily: 'f1',
                fontWeight: FontWeight.w700,
                fontSize: 28,
                color: Colors.white,
            letterSpacing: 1.5),
          ),
      ),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 650,
            child: Getx.quotes.canUpdate?Lottie.network(
                'https://lottie.host/f1168197-847e-441b-823f-d2551f20500e/Zkd3fXAqQd.json',width: 300,height: 300):Obx(
              () =>  Swiper(
                outer: true,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: GestureDetector(
                      onDoubleTap: () {
                        Getx.onDoubleTap();
                        Getx.insertRecord(Getx.quotes[index].quote,Getx.quotes[index].author,Getx.quotes[index].category,themes[index]['link']);
                            if(Getx.quotes[index].category=='General')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Others/kindness.jpg');
                              }
                            if(Getx.quotes[index].category=='Life')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Religious_And_Spritual/life.jpg');
                              }
                            if(Getx.quotes[index].category=='Love')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Love_And_Relationship/love.jpg');
                              }
                            if(Getx.quotes[index].category=='Success')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Motivation_And_Inspiration/success.jpg');
                              }
                            if(Getx.quotes[index].category=='Motivation')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Motivation_And_Inspiration/creativity.jpg');
                              }
                            if(Getx.quotes[index].category=='Happiness')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Self_Development/smile.jpg');
                              }
                            if(Getx.quotes[index].category=='Powerful')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Love_And_Relationship/trust.jpg');
                              }
                            if(Getx.quotes[index].category=='Friendship')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Love_And_Relationship/friendship.jpg');
                              }
                            if(Getx.quotes[index].category=='Humor')
                              {
                                Getx.likeSave(Getx.quotes[index].category,'assets/Images/img/Motivation_And_Inspiration/funny.jpg');
                              }
                      },
                      onTap: () {
                        Getx.selectQuote(index);
                        Getx.setTheme(themes[index]['link'],index);
                        Get.to(MakeTheme(),transition: Transition.cupertinoDialog,duration: Duration(milliseconds: 2000));
                      },
                      child: Obx(
                        () =>  Container(
                          width: 400,
                          height: 650,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Color(0xff325076),
                            borderRadius: BorderRadius.circular(20),
                            image: (Getx.showWallpepar.value)
                                ? DecorationImage(
                              image: AssetImage(themes[index]['link']),
                              fit: BoxFit.cover,
                            )
                                : null,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.black38,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Obx(
                                    () =>  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.format_quote_outlined,
                                          color: (Getx.showWallpepar.value)
                                              ?Colors.white:Colors.black,
                                        ),
                                        Text(
                                          Getx.quotes[index].quote,
                                          style: TextStyle(
                                            fontFamily: Getx.fontFamily.value,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: (Getx.showWallpepar.value)
                                                ?Colors.white:Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '- ${Getx.quotes[index].author} -',
                                          style: TextStyle(
                                            fontFamily: Getx.fontFamily.value,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: (Getx.showWallpepar.value)
                                                ?Colors.white:Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width:300,
                                    height: 300,
                                    child: Obx(() => AnimatedOpacity(
                                          opacity: Getx.likeOpacity.value,
                                          duration: Duration(milliseconds: 500),
                                          child: Lottie.network(
                                              'https://lottie.host/25c3bad9-6ec3-419f-8dac-e919c37cb795/bqUaxewzpF.json',width: 500,height: 500),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: Getx.quotes.length,
                itemWidth: 400.0,
                itemHeight: 650.0,
                layout: SwiperLayout.TINDER,
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff12213C),
                child: IconButton(onPressed: () {
                  categoryBottomSheet(context);
                }, icon: Icon(Icons.category),color: Colors.white,),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff12213C),
                child: IconButton(
                    onPressed: () {
                      favBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ))
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff12213C),
                child: IconButton(
                    onPressed: () {
                      Getx.showWallpeparUi();
                    },
                    icon: Icon(
                      Icons.wallpaper_rounded,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}




