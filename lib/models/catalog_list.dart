import 'package:example1/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../uti/MyTheme.dart';
import 'cart.dart';
import 'catalog_image.dart';
import '../widgets/Homepages/home_details_p.dart';
import 'catalog.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailsPage(
                    catalog: catalog,
                  ),
                )),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

//list of items

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
<<<<<<< HEAD
      child: Row(children: [
        //Big image animation
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            catalog.name.text.bold.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                _AddToCart(catalog: catalog),
              ],
            ),
          ],
        ))
      ]),
=======
      child: Row(
        children: [

          //Big image animation
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              catalog.name.text.bold.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  _AddToCart(catalog: catalog,)
                ],
              ),
            ],
              ))
        ],
      ),
>>>>>>> 1a16da0 (11day)
    ).white.rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({Key? key, required this.catalog}) : super(key: key);
  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) != false;
    return ElevatedButton(
      onPressed: () {
<<<<<<< HEAD
        isInCart = isInCart.toggle();
        final _catalog = CatalogModel();

        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
=======
        isAdded = isAdded.toggle();

        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);

>>>>>>> 1a16da0 (11day)
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      //if the following condition is true then show done icon ,else show " add to cart"
      child: isInCart ? const Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
