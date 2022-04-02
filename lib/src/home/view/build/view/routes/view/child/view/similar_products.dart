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
        Padding,
        Row,
        SliverGridDelegateWithFixedCrossAxisCount,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

//import 'package:flutter/src/foundation/key.dart';

///
class SimilarProducts extends StatefulWidget {
  ///
  const SimilarProducts({Key? key}) : super(key: key);

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  final _products = [
    {
      'name': 'Blazer',
      'image': 'images/recentImages/blazer1.jpeg',
      'oldPrice': 1200,
      'price': 900,
    },
    {
      'name': 'Dress',
      'image': 'images/recentImages/dress1.jpeg',
      'oldPrice': 888,
      'price': 200,
    },
    {
      'name': 'Heals1',
      'image': 'images/recentImages/skt1.jpeg',
      'oldPrice': 1020,
      'price': 910,
    },
    {
      'name': 'Heals',
      'image': 'images/recentImages/hills1.jpeg',
      'oldPrice': 1020,
      'price': 910,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: Hero(
            tag: _products[i]['name']!,
            child: Material(
              child: InkWell(
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
                            "${_products[i]['name']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "\$ ${_products[i]['price']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Image.asset(
                    _products[i]['image'] as String,
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
