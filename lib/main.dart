import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'Screens/MakeYourTheme/View/MakeTheme.dart';
import 'Screens/ShareSavePage/View/ShareSaveScreen.dart';
import 'Screens/SplashScreen/SplashScreen.dart';

void main()
{
  runApp(const QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      getPages: [
        GetPage(name: '/', page: () =>  const SplashScreen()),
        GetPage(name: '/MakeTheme', page: () =>  const MakeTheme()),
        GetPage(name: '/Category', page: () =>  const ShareSaveScreen()),
      ],
    );
  }
}