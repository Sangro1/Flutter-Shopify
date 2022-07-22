
import 'package:example1/pages/home_page.dart';
import 'package:example1/shop_by_category.dart';
import 'package:example1/uti/routes.dart';
import 'package:example1/uti/slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = 'Shopping.in';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode:ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.blueGrey,),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),

      //home: InboxPage(),
      //home: LoginPage(),
      initialRoute: "/",
      routes: {
        "/" : (context) =>  LoginPage(),
        //calling routing class here
        MyRoutes.homeRoute : (context) => MyHomePage(title: appTitle,),
        MyRoutes.secondRoute:(context)=> SecondPage(),
        MyRoutes.loginRoute:(context) => LoginPage(),
        MyRoutes.shopCate:(context) => ShopCate(),
       // "/loginPage" : (context) => LoginPage(), MyHomePage(title: appTitle,),
        //"/SecondPage" : (context) => SecondPage(),

      },
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: GoogleFonts.roboto(),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      //Here Drawer scroll
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),

              child: Text('Browse\n Account',
                style:TextStyle(fontWeight:FontWeight.bold, fontSize:25,),),
            ),

            SizedBox(height: 40, child:TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Home', style: TextStyle(
                    fontWeight:FontWeight.bold,fontSize:20,),
                ),
            ),
            ),

            Divider(
              color: Colors.grey,
              thickness: 3,
            ),
            Text('Trending', style: TextStyle(
                fontWeight:FontWeight.bold,fontSize:20),),
            //items list
            ListTile(
              title: const Text('Best Sellers',),
              onTap: () {
                Navigator.pushNamed(context,'/SecondPage');
              },
            ),
            ListTile(
              title: const Text('New Releases'),
              onTap: () {
                Navigator.pushNamed(context,'/SecondPage');
              },
            ),
            ListTile(
              title: const Text('Movers and Shakers'),
              onTap: () {
                Navigator.pushNamed(context,'/SecondPage');
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 3,
            ),
            Text('Top Categories For You',
              style: TextStyle(
                  fontWeight:FontWeight.bold,fontSize:20),),

            ListTile(
              title: const Text('Mobiles'),
              onTap: () {
                Navigator.pushNamed(context,'/SecondPage');
              },
            ),
            ListTile(
              title: const Text('Computers'),
              onTap: () {
                Navigator.pushNamed(context,'/SecondPage');
              },
            ),
            ListTile(
              title: const Text('Books'),
              onTap: () {
                Navigator.pushNamed(context,'/SecondPage');
              },
            ),
            ListTile(
              title: const Text('Fashion'),
              onTap: () {
                Navigator.pushNamed(context,'/SecondPage');
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.shopCate);
              }, child: Text('See All Categories'),
            ),

            Divider(
              color: Colors.grey,
              thickness: 3,
            ),
            Text('Programs & Features', style: TextStyle(fontWeight:FontWeight.bold,fontSize:20),),
            ListTile(
              title: const Text('Today Deals'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Try Subscription'),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
            ),
          ],
        ),
      ),
      //Home Slider activity
        body: HomeSlider(),
    );
  }
}

