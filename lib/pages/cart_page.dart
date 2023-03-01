// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catalog_app/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/widgets/themes.dart';

import '../models/phonedata.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(title: Text("Cart Page")),
      body: cart.items.isEmpty
          ? Center(child: Text("No items in the cart"))
          : Consumer<CartModel>(
              builder: (context, value, child) {
                return ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return CartItem(item: cart.items[index]);
                    });
              },
            ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.m0,
        children: [
          Consumer<CartModel>(builder: ((context, value, child) {
            final total = cart.totalPrice();
            return "\$${total}".text.bold.xl3.make();
          })),
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
            onPressed: () {
              var cart = context.read<CartModel>();
              cart.remove(item);
            },
            icon: Icon(CupertinoIcons.delete, color: context.theme.hintColor)),
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
