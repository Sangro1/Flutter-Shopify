import 'package:example1/uti/MyTheme.dart';
import 'package:example1/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/catalog_list.dart';
import '../widgets/Homepages/home_widgets.dart';
import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int days = 30;
  final String name = "Cubexo";

  //final String url = "";
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final firstJson = await rootBundle.loadString("assets/files/first.json");
    final decodedData = jsonDecode(firstJson);
    //print(decodedData);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      //appBar: AppBar( ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShoopingHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().py16(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}






