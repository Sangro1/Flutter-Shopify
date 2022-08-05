import 'package:example1/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../uti/MyTheme.dart';
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
                  _AddToCart()
                ],
              ),
            ],
              ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }

}

class _AddToCart extends StatefulWidget {
  const _AddToCart({Key? key}) : super(key: key);
  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        // final _catalog = CatalogModel();
        // final _cart = CartModel();
        // _cart.add(_catalog);
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      //if the following condition is true then show done icon ,else show " add to cart"
      child: isAdded ? const Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}

