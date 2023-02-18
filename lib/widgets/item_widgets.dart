import 'package:flutter/material.dart';
import '../models/phonedata.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) 
  :assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.description),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.2,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            print("item ${item.name} presed");
          },
        ),
      ),
    );
  }
}
