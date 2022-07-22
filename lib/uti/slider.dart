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

     //         //   child: PageView.builder(
     //            //     controller: pageController,
     //            //          itemCount: 5,
     //            //         itemBuilder: (context, position) {
     //            //        return _buildPageItem(position);
     //            //        }),
     //          ),
     //
     //         // new DotsIndicator(
     //          //          dotsCount: 5,
     //          //          position: _currPageValue,
     //          //         decorator: DotsDecorator(
     //          //         size: const Size.square(9.0),
     //          //      activeSize: const Size(18.0, 9.0),
     //          //      activeShape: RoundedRectangleBorder(borderRadius:
     //          //      BorderRadius.circular(5.0)),
     //          //      ),
       ),
           ],
          );
  }
  }
