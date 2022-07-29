import 'package:flutter/material.dart';

class ExploreGrid extends StatelessWidget {
  const ExploreGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount:40,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ),
    itemBuilder: (context ,index) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.red[900],
        ),
      );
    }
    );
  }
}
