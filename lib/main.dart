// ignore_for_file: unused_element

import 'package:example1/auth_service.dart';
import 'package:example1/pages/cart_p.dart';
import 'package:example1/pages/register_page.dart';
import 'package:example1/uti/MyTheme.dart';
import 'package:example1/pages/home_page.dart';
import 'package:example1/uti/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'new_home.dart';
import 'pages/login_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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


      routes: {
         "/": (context) => AuthService().handleAuthState(),

        //calling routing class here
        MyRoutes.registerRoute:(context) => RegisterPage(),
        MyRoutes.loginRoute:(context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MyHomePage(),
        MyRoutes.newRoute:(context) => NewHomePage(),
        MyRoutes.cartRoute: (context) => MyCart(),
      },
    );
  }
}
