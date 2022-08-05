
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../uti/MyTheme.dart';
//Home Header
class ShoopingHeader extends StatelessWidget {
  const ShoopingHeader({Key? key}) : super(key: key);

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
