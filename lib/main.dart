import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/colors.dart';
import 'view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: AppBarTheme(color: primaryColor),
        backgroundColor: primaryColor,


      ),
      getPages: [
        GetPage(name: '/home', page: () => HomeView()),
      ],);
  }
}


