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

import 'package:bazaar/src/model.dart' show productsItems;

import 'package:bazaar/src/view.dart' show ProductDetails, StateMVC;

import 'package:bazaar/src/controller.dart' as c;

class RecentProducts extends StatefulWidget {
  const RecentProducts({Key key}) : super(key: key);

  @override
  _RecentProductsState createState() => _RecentProductsState();

  static search(String word) => _RecentProductsState.search(word);

  static clear() => _RecentProductsState.clear();
}

class _RecentProductsState extends StateMVC<RecentProducts> {
  _RecentProductsState() : super(c.HomeAppBar());
  List<Map<String, dynamic>> itemsList;

  static search(String word) {
    String search = word.toLowerCase();
    items = productsItems.where((m) {
      String name = m['name'];
      return name.toLowerCase().indexOf(search) > -1;
    }).toList();
  }

  static clear() => items = null;

  static List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      itemsList = productsItems;
    } else {
      itemsList = items;
    }
    return GridView.builder(
      itemCount: itemsList.length,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: Hero(
            tag: itemsList[i]['name'],
            child: Material(
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      productDetailsName: itemsList[i]['name'],
                      productDetailsImage: itemsList[i]['image'],
                      productDetailsoldPrice: itemsList[i]['oldPrice'],
                      productDetailsPrice: itemsList[i]['price'],
                      productDetailsDesc: itemsList[i]['prodDesc'],
                    ),
                  ),
                ),
                child: GridTile(
                  child: Image.asset(
                    itemsList[i]['image'],
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    height: 30.0,
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${itemsList[i]['name']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "\$ ${itemsList[i]['price']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
