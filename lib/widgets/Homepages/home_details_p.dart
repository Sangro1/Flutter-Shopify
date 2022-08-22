import 'package:example1/uti/MyTheme.dart';
import 'package:example1/models/catalog.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import 'add_to_cart.dart';

//big images
class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red700.make(),
            AddToCart(catalog: catalog),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                  height: 50,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl
                            .color(MyTheme.darkBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpandableText(
                              "Display a bit bigger than the 5.8 three signature colors silver, graphite, and gold,as well as a fourth, brand new color option, a blue model. Storage for the base model is 128GB, 'and you can also buy a 256GB and a 512GB versions.Another beauty from Apple. I was upgraded from iPhone X and it was great experience with all the latest specs and flawlessly smooth.",
                              style: new TextStyle(
                                fontSize: 11,
                              ), expandText: 'Show more',
                              collapseText: 'Show less',
                              //Foldable text
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).py64()),
            )
          ],
        ),
      ),
    );
  }
}

