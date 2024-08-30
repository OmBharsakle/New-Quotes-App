import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/Screens/ShareSavePage/View/ShareSaveScreen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../Utils/global.dart';

class MakeTheme extends StatelessWidget {
  const MakeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A2946),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Make Your Theme',
          style: TextStyle(
              fontFamily: 'f1',
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          Center(
            child: Obx(
              () => Container(
                width: 350,
                height: 550,
                decoration: BoxDecoration(
                    // color: Color(0xff325076),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(Getx.themeSelect.toString()),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.format_quote_outlined,
                          color: Colors.white,
                        ),
                        Obx(
                          () => Text(
                            Getx.quotes[Getx.selectQuotes.toInt()].quote,
                            style: TextStyle(
                              fontFamily: Getx.fontFamily.toString(),
                              fontWeight: FontWeight.w600,
                              fontSize: Getx.fontValue.value,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          '- ${Getx.quotes[Getx.selectQuotes.toInt()].author} -',
                          style: TextStyle(
                            fontFamily: Getx.fontFamily.toString(),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // Bottom Part
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: Text(
              'Font Size',
              style: TextStyle(
                  fontFamily: 'f1',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          Obx(
            () => SfSlider(
              min: 15.0,
              max: 30.0,
              value: double.parse(Getx.fontValue.toString()),
              interval: 5,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              showDividers: true,
              minorTicksPerInterval: 1,
              activeColor: Colors.white,
              onChanged: (dynamic value) {
                Getx.setFontSize(value);
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff12213C),
                child: IconButton(
                    onPressed: () {
                      modalBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.collections,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff12213C),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.color_lens,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff12213C),
                child: IconButton(
                    onPressed: () {
                      fontBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.font_download,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff12213C),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff12213C),
                child: IconButton(
                  onPressed: () {
                    Get.to(ShareSaveScreen(),transition: Transition.cupertino,duration: Duration(milliseconds: 2000));
                  },
                  icon: Icon(
                    Icons.done_all,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
