

class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "iPhone13 Pro Max",
        desc:
            "Coming with superb specs and stunning features you can buy Apple iPhone 13 online. ",
        price: 999,
        color: "white",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgjNPCod9e0ssFbY1O2bsF3EO7TYGjN6IBIsvhlcbSzQEuOGg7qO6Nd69YslWzTN_B9ls&usqp=CAU")
  ];
}

class Item {
  final int id;
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
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"],
    );
  }
  //map se id m data le rahe the now id se map m data lenge
   toMap() => {
      "id" :id,
     "name" : name,
     "desc" : desc,
     "price" : price,
     "color" : color,
    "image" : image,

  };
}
