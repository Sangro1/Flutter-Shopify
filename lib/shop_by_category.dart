import 'package:example1/uti/shop_grid.dart';
import 'package:flutter/material.dart';

class ShopCate extends StatelessWidget {
  const ShopCate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 20,
        title:ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey[300],
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey[500],),
                Container(
                  child: Text('Search in Shop by Category',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ExploreGrid(),
    );
  }
}