import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes/Screens/HomeScreen/View/Home_Page.dart';
import 'package:share_extend/share_extend.dart';
import '../../../Utils/global.dart';
import 'dart:ui';
import 'dart:ui'as ui;

class ShareSaveScreen extends StatelessWidget {
  const ShareSaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Getx.themeSelect.toString()),
                      fit: BoxFit.cover)),
              child: Container(
                color: Colors.black45,
                child: Container(
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
          Positioned(
            top: screenHeight * 0.91,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xff12213C),
                  child: IconButton(
                    onPressed: () {
                      allTaskBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.format_align_left_rounded,
                      color: Colors.white,
                    ),
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




GlobalKey _globalKey = GlobalKey();

saveLocalImage() async {
  RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 1.0);
  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
  await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
}

saveLocalImageHD() async {
  RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 2.0);
  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
  await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
}

saveLocalImage4k() async {
  RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 5.0);
  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
  await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
}

shareLocalImage(String extraText) async {
  RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image imageUi = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await imageUi.toByteData(format: ui.ImageByteFormat.png);
  Uint8List img = byteData!.buffer.asUint8List();
  final path = await getApplicationCacheDirectory();
  File file = File("${path.path}/img.png");
  file.writeAsBytes(img);
  ShareExtend.share(file.path, "image",extraText: extraText);
}

shareLocalOnlyImage() async {
  RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image imageUi = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await imageUi.toByteData(format: ui.ImageByteFormat.png);
  Uint8List img = byteData!.buffer.asUint8List();
  final path = await getApplicationCacheDirectory();
  File file = File("${path.path}/img.png");
  file.writeAsBytes(img);
  ShareExtend.share(file.path, "image");
}

captureAndSetWallpaper() async {
  RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image imageUi = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await imageUi.toByteData(format: ui.ImageByteFormat.png);
  Uint8List img = byteData!.buffer.asUint8List();
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/img.png';
  File file = File(path);
  await file.writeAsBytes(img);
  int location = WallpaperManager.HOME_SCREEN;
  bool result = await WallpaperManager
      .setWallpaperFromFile(
      file.path, location);
}
