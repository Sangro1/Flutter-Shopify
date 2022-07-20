
import 'package:example1/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = 'Shopping Cart';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      color: Colors.orange,

      home: MyHomePage(title: appTitle,),
      //home: InboxPage(),
      //home: LoginPage(),

    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style:GoogleFonts.acme()),
        backgroundColor: Colors.orangeAccent,
      ),

      //Here Drawer scroll
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Text('Browse\nAccount',
                style:TextStyle(fontWeight:FontWeight.bold, fontSize: 20),),
            ),
            Divider(
              color: Colors.black,
            ),
            Text('Trending', style: TextStyle(fontWeight:FontWeight.bold,fontSize:20),),
            //items list
            ListTile(
              title: const Text('Best Sellers',),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('New Releases'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Movers and Shakers'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.black,
            ),
            Text('Top Categories For You',
              style: TextStyle(fontWeight:FontWeight.bold,fontSize:20),),

            ListTile(
              title: const Text('Mobiles'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Computers'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Books'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Fashion'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            TextButton(onPressed: () {Navigator.pop(context);}, child: Text('See All Categories')),
            Divider(
              color: Colors.black,
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),


    );
  }
}