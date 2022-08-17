import 'package:example1/models/catalog.dart';

class CartModel {

 late CatalogModel _catalog;
  //collection of Ids - store ids of each items
  final List<int> _itemIds = [];


  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    //null nahi hona chahiye
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();



  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
