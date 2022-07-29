import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Shopping Catelog'),
            backgroundColor: Colors.red[900],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Hot'),
                Tab(text: 'New'),
                Tab(text: 'Sale'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
