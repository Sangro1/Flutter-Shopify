import 'package:example1/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item})
      : assert(item != null), super(key: key);
  //assert only use in debugging
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.3,
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        //product name
        title: Text(item.name),
        //product description
        subtitle: Text(item.desc),
        trailing: Text( "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
