class CatalogModel {
  static final products = [
    Item(
        id: "Miski1",
        name: "iPhone13",
        desc: "Coming with superb specs and stunning features you can buy Apple iPhone 13 online. ",
        price: 70990,
        color: "white",
        image: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1645036276543")
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
//named const
}
