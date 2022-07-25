import 'package:example1/models/catelog.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = "Cubexo";
  final String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Miski"),
      ),
      // body: ListView.builder(
      //     //itemCount: CatalogModel.items.length,
      //   itemBuilder: (context, index){
      //       return ItemWidget(
      //           item: Null,
      //       );Coming with superb specs and stunning features you can buy Apple iPhone 13 online.
      //   },
      // ),
      drawer: MyDrawer(),
    );
  }
}
