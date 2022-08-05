import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  MyTheme(BuildContext context);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.indigo,
    canvasColor: creamColor,
    cardColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
      );
         static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
           fontFamily: GoogleFonts.poppins().fontFamily,
           canvasColor: darkcreamColor,
           cardColor: Colors.black,

           appBarTheme: AppBarTheme(
             color: Colors.black,
             elevation: 0.0,
             iconTheme: IconThemeData(color: Colors.white),
             toolbarTextStyle: TextStyle(color: Colors.white),
             titleTextStyle: Theme.of(context).textTheme.headline6,
           ),
      );
  //Custom Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color darkcreamColor = Vx.gray800;
  static Color lightBluishColor = Vx.purple400;
}
// Color(0xff403b58) dark bluishcolor
// red color Color(0xffD50000)
