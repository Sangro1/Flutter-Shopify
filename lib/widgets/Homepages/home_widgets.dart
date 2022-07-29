
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../uti/MyTheme.dart';

class ShoopingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Shopping App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
