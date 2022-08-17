import 'package:example1/auth_service.dart';
import 'package:example1/pages/camera.dart';
import 'package:example1/pages/cart_p.dart';
import 'package:example1/pages/map_page.dart';
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
  static const appTitle = 'Shopping.dart';

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
          MyRoutes.registerRoute: (context) => const RegisterPage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.homeRoute: (context) => const MyHomePage(),
          MyRoutes.newRoute: (context) => const NewHomePage(),
          MyRoutes.cartRoute: (context) => const MyCart(),
          MyRoutes.mapRoute: (context) => const MyMap(),
          MyRoutes.cameraRoute: (context) => const MyCamera(),
        });
  }
}
