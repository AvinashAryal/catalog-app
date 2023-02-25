// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/phonedata.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.m0,
        children: [
          "\$${catalog.price}"
              .text
              .bold
              .xl2
              .color(MyTheme.darkBluishColor)
              .make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(MyTheme.darkBluishColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
            child: "Buy".text.make(),
          ).w32(context),
        ],
      ).p16(),
      backgroundColor: MyTheme.creamColor,
      body: Column(children: [
        SafeArea(
          child: Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image).box.rounded.make(),
          ).h40(context),
        ),
        Expanded(
          child: VxArc(
            height: 30.0,
            child: Container(
              width: context.screenWidth,
              color: MyTheme.creamColor,
              child: Column(children: [
                catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                catalog.description.text
                    .color(MyTheme.darkBluishColor)
                    .textStyle(context.captionStyle)
                    .make(),
              ]),
            ),
          ),
        ),
        "Erat gubergren dolor erat justo ut diam eos rebum rebum ipsum, et invidunt tempor eirmod diam invidunt. Eos sed et."
            .text
            .textStyle(context.captionStyle)
            .xl
            .make()
            .p16(),
      ]).p16(),
    );
  }
}
