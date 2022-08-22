import 'package:example1/models/catalog.dart';

class CartModel {
//Make class Singleton
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  late CatalogModel _catalog;
  //collection of Ids - store ids of each items
  final List<int> _itemIds = [];
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    //newCatalog not null
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

//will remove the product here
  void remove(Item item) {
    _itemIds.remove(item.id);
    _catalog;
  }
}
