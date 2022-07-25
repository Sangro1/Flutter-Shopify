import 'package:example1/uti/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sliderpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: GoogleFonts.roboto(),
        ),
        backgroundColor: Colors.blueGrey,
      ),

      //Here Drawer scrollloginRoute
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),

              child: Text('Browse\n Account',
                style:TextStyle(fontWeight:FontWeight.bold, fontSize:30,),),
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
                fontWeight:FontWeight.bold,fontSize:22),),
            //items list
            ListTile(
              title: const Text('Best Sellers',),
              onTap: () {
                Navigator.pushNamed(context,MyRoutes.secondRoute);
              },
            ),
            ListTile(
              title: const Text('New Releases'),
              onTap: () {
                Navigator.pushNamed(context,MyRoutes.secondRoute);
              },
            ),
            ListTile(
              title: const Text('Movers and Shakers'),
              onTap: () {
                Navigator.pushNamed(context,MyRoutes.secondRoute);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 3,
            ),
            Text('Top Categories For You',
              style: TextStyle(
                  fontWeight:FontWeight.bold,fontSize:22),),

            ListTile(
              title: const Text('Mobiles'),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.secondRoute);
              },
            ),
            ListTile(
              title: const Text('Computers'),
              onTap: () {
                Navigator.pushNamed(context,MyRoutes.secondRoute);
              },
            ),
            ListTile(
              title: const Text('Books'),
              onTap: () {
                Navigator.pushNamed(context,MyRoutes.secondRoute);
              },
            ),
            ListTile(
              title: const Text('Fashion'),
              onTap: () {
                Navigator.pushNamed(context,MyRoutes.secondRoute);
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
            Text('Programs & Features', style:
            TextStyle(fontWeight:FontWeight.bold,fontSize:22),),
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
