import 'package:bazaar/src/controller.dart' show ControllerMVC, ProductSearch;

import 'package:bazaar/src/view.dart' show Cart;

import 'package:flutter/material.dart'
    show
        Icon,
        IconButton,
        Icons,
        MaterialPageRoute,
        Navigator,
        Widget,
        showSearch;

///
class HomeAppBar extends ControllerMVC {
  ///
  factory HomeAppBar() => _this ??= HomeAppBar._();
  HomeAppBar._();
  static HomeAppBar? _this;

  ///
  Widget get search => IconButton(
        icon: const Icon(Icons.search),
        onPressed: () async {
          await showSearch(
              context: stateMVC!.context, delegate: ProductSearch());
          refresh();
        },
      );

  ///
  Widget get cart => IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(stateMVC!.context).push(
              MaterialPageRoute<void>(builder: (context) => const Cart()));
        },
      );
}
