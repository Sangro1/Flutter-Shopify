import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  MyTheme(BuildContext context);

  static ThemeData lightTheme(BuildContext context)=> ThemeData(
  primarySwatch: Colors.red,
  fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
      titleTextStyle: Theme.of(context).textTheme.headline6,
    ),);
    static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      );
    //Custom Colors
    static Color creamColor = Color(0xfff5f5f5);
    static Color darkBluishColor = Color(0xff403b58);
}
// Color(0xff403b58) dark bluishcolor
// red color Color(0xffD50000)