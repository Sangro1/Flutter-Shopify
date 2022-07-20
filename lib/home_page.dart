import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);
  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(     length: 3,
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text('Inbox'),
              backgroundColor: Colors.orange,
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Messages',),
                  Tab(text:'Taps',),
                  Tab(text:'Albums',)
                ],
              ),
            ),
            bottomNavigationBar:BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled),label:'Browse',),
                BottomNavigationBarItem(icon: Icon(Icons.messenger),label: 'Inbox'),
                BottomNavigationBarItem(icon: Icon(Icons.star),label: 'faves'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Store'),
            ],),

          ),
      ),
    );

  }
}
