import 'package:alert_dialog/alert_dialog.dart';
import 'package:example1/models/cart.dart';
import 'package:example1/models/catalog.dart';
import 'package:example1/uti/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//Buying Page
class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.make(),30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet".text.make()),

              );
            },
            child:"Buy".text.make(),
          ).w32(context),
        ],
      ),
    );
  }
}
class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);
  @override
  State<_CartList> createState() => _CartListState();
}
class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {

    bool isInCart = _cart.items.contains(widget.card);

    return _cart.items.isEmpty ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
              itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed : () {
                 isInCart = isInCart.toggle();
                 final _cart = CartModel();
                 _cart.catalog = CatalogModel();
                 setState(() {

                 });
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
