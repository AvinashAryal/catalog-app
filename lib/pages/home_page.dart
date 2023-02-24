import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:catalog_app/models/phonedata.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/themes.dart';
//import 'package:catalog_app/widgets/drawer.dart';
//import 'package:catalog_app/widgets/item_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var phonesJSON = await rootBundle.loadString("assets/files/phones.json");
    var decodedData = jsonDecode(phonesJSON);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Header(),
            CatalogModel.items.isEmpty || CatalogModel.items == null?
              Center(child: CircularProgressIndicator(),):CatalogList(),
          ]),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      "Catalog App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
      "Trending Products".text.xl2.make(),
    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder:(context,index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      }
    );
  }
}

class CatalogItem
 extends StatelessWidget {
  final Item catalog;
  const CatalogItem
  ({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}