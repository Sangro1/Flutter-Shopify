import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../uti/MyTheme.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.py8.color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}