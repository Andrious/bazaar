import 'package:flutter/material.dart'
    show
        Icon,
        IconButton,
        Icons,
        MaterialPageRoute,
        Navigator,
        Widget,
        showSearch;

import 'package:bazaar/src/view.dart' show Cart;

import 'package:bazaar/src/controller.dart'
    show ControllerMVC, ProductSearch;

class HomeAppBar extends ControllerMVC {

  factory HomeAppBar(){
    return _this ??= HomeAppBar._();
  }
  static HomeAppBar _this;
  HomeAppBar._();

  Widget get search => IconButton(
        icon: Icon(Icons.search),
        onPressed: () async {
          await showSearch(context: stateMVC.context, delegate: ProductSearch());
          refresh();
        },
      );

  Widget get cart => IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(stateMVC.context)
              .push(MaterialPageRoute(builder: (context) => Cart()));
        },
      );
}
