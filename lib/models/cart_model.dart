import 'package:catalog_app/models/phonedata.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<Item> items = [];

  get itemlist => null;

  void add(Item item) {
    if (items.contains(item)) {
      return;
    }
    items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    items.remove(item);
    notifyListeners();
  }

  num totalPrice(){
    num tot = 0;
    if(items.isEmpty)
    {
      return tot;
    }
    for(final e in items)
    {
      tot += e.price;
    }
    return tot; 
  }
}
