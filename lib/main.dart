import 'package:example1/uti/second_page.dart';
import 'package:example1/shop_by_category.dart';
import 'package:example1/uti/routes.dart';
import 'package:example1/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = 'Shopping.in';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),

      initialRoute: "/",
     // initialRoute: MyRoutes.homeRoute,

      routes: {
        "/": (context) => LoginPage(),
        //calling routing class here
        MyRoutes.homeRoute: (context) => MyHomePage(),
        MyRoutes.secondRoute: (context) => SecondPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.shopCate: (context) => ShopCate(),
        // "/loginPage" : (context) => LoginPage(), MyHomePage(title: appTitle,),
        //"/SecondPage" : (context) => SecondPage(),
      },
    );
  }
}
