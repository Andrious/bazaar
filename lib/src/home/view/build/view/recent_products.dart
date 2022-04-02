import 'package:bazaar/src/controller.dart' as c;

import 'package:bazaar/src/model.dart' show productsItems;

import 'package:bazaar/src/view.dart' show ProductDetails, StateMVC;

import 'package:flutter/material.dart'
    show
        BoxFit,
        BuildContext,
        Card,
        Colors,
        Container,
        EdgeInsets,
        FontWeight,
        GridTile,
        GridView,
        Hero,
        Image,
        InkWell,
        Key,
        MainAxisAlignment,
        Material,
        MaterialPageRoute,
        Navigator,
        Padding,
        Row,
        SliverGridDelegateWithFixedCrossAxisCount,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

///
class RecentProducts extends StatefulWidget {
  ///
  const RecentProducts({Key? key}) : super(key: key);

  @override
  _RecentProductsState createState() => _RecentProductsState();

  ///
  static void search(String word) => _RecentProductsState.search(word);

  ///
  static void clear() => _RecentProductsState.clear();
}

class _RecentProductsState extends StateMVC<RecentProducts> {
  _RecentProductsState() : super(c.HomeAppBar());

  static void search(String word) {
    final String search = word.toLowerCase();
    items = productsItems.where((m) {
      final String name = m['name'];
      return name.toLowerCase().contains(search);
    }).toList();
  }

  static void clear() => items = null;

  static List<Map<String, dynamic>>? items;
  List<Map<String, dynamic>>? itemsList;

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      itemsList = productsItems;
    } else {
      itemsList = items;
    }
    return GridView.builder(
      itemCount: itemsList!.length,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: Hero(
            tag: itemsList![i]['name'],
            child: Material(
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => ProductDetails(
                      productDetailsName: itemsList![i]['name'],
                      productDetailsImage: itemsList![i]['image'],
                      productDetailsoldPrice: itemsList![i]['oldPrice'],
                      productDetailsPrice: itemsList![i]['price'],
                      productDetailsDesc: itemsList![i]['prodDesc'],
                    ),
                  ),
                ),
                child: GridTile(
                  footer: Container(
                    height: 30,
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${itemsList![i]['name']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "\$ ${itemsList![i]['price']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Image.asset(
                    itemsList![i]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
