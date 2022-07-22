import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scalefactor = 0.8;
  double _height = 70;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState((){
        _currPageValue = pageController.page!;
        print("Current value is" + _currPageValue.toString());

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //          //slider section
        SizedBox(
          height: 40,
        ),

        Container(
          color: Colors.blueGrey,
          height: 50,

        )
      ],
    );
  }
}