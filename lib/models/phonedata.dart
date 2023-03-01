class CatalogModel {
  static List<Item> items = [];

  static Item getByID(int id) {
    return items.firstWhere((element) => element.id == id, orElse: null);
  }

  static Item getByPosition(int position) {
    return items[position];
  }
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
  //Data Class Generator Extension can perform this task easily
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      description: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": description,
        "price": price,
        "color": color,
        "image": image,
      };
}
