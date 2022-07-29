import 'package:example1/uti/MyTheme.dart';
import 'package:example1/pages/home_page.dart';
import 'package:example1/uti/second_page.dart';
import 'package:example1/shop_by_category.dart';
import 'package:example1/uti/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'firebase_options.dart';

 Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
 }

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  static const appTitle = 'Shopping.in';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

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