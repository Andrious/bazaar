import 'package:flutter/material.dart';

import 'package:shopping_cart/src/model.dart';
import 'package:shopping_cart/src/view.dart';
import 'package:shopping_cart/src/controller.dart';

class HomeAppBar extends ControllerMVC {
  Widget get search => IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(context: stateMVC.context, delegate: ProductSearch());
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
