import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../../uti/MyTheme.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);
  @override
  State<AddToCart> createState() => AddToCartState();
}
class AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  // bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    //isInCart isAdded will see
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        //will remove
        isInCart = isInCart.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
        shape: MaterialStateProperty.all(
            const StadiumBorder()),
      ),
      //if the following condition is true then show done icon ,else show " add to cart"
      child: isInCart ? const Icon(CupertinoIcons.cart_fill_badge_plus) : "Add to cart".text.make(),
    );
  }
}
