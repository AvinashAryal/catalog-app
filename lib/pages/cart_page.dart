// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/widgets/themes.dart';

import '../models/phonedata.dart';
import '../widgets/themes.dart';

class CartPage extends StatelessWidget {
  final List<Item> itemlist;

  const CartPage({
    Key? key,
    required this.itemlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Page")),
      body: itemlist.isEmpty
          ? Center(child: Text("No items in the cart"))
          : ListView.builder(
              itemCount: itemlist.length,
              itemBuilder: ((context, index) {
                return CartItem(item: itemlist[index]);
              }),
            ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.m0,
        children: [
          "\$${100}".text.bold.xl2.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
//              backgroundColor:
//                  MaterialStateProperty.all(MyTheme.darkBluishColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
            child: "Buy".text.make(),
          ).w32(context),
        ],
      ).p16(),
    );
  }
}

class CartItem extends StatelessWidget {
  final Item item;
  const CartItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: true,
        leading: CartItemImage(image: item.image),
        title: item.name.text.bold.make(),
        subtitle: "\$${item.price}".text.bold.make(),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.delete, color: MyTheme.lightColor)),
      ),
    ).box.rounded.p8.make();
  }
}

class CartItemImage extends StatelessWidget {
  final String image;
  const CartItemImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.make().w20(context).h20(context);
  }
}
