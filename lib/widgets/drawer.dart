import 'package:example1/uti/MyTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../uti/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://avatars.githubusercontent.com/u/87020382?s=400&u=fed6383984f3e8b50dd6c30eddc6129525196e6a&v=4";

    return Drawer(
      child: Container(
        color: MyTheme.darkcreamColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              // decoration: BoxDecoration(color: Colors.red[900]),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: MyTheme.darkcreamColor),
                accountName: const Text("Bhupesh Chouhan"),
                accountEmail: const Text("bhupeshchouhan15@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  //here we add camera instead of hard code
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            //1.Home Button
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            //2.Profile
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.cartRoute);
              },
              leading: const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: const Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            //3.Google Map Button
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.mapRoute);
              },
              leading: const Icon(
                CupertinoIcons.location_solid,
                color: Colors.white,
              ),
              title: const Text(
                "location ",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            //4.Camera Button
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.cameraRoute);
              },
              leading: const Icon(
                CupertinoIcons.camera,
                color: Colors.white,
              ),
              title: const Text(
                "Camera",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
