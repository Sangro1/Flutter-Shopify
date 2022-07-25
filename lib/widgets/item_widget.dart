import 'package:example1/models/catelog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item}) :
        assert(item!= null), super(key: key);
  //assert only use in debugging

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(item.image),
      title: Text(item.name),
      subtitle: Text(item.desc),
      trailing: Text(
        "\$${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.red[900],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
