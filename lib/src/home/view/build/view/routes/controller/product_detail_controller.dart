import 'package:flutter/material.dart'
    show Color, Icon, IconButton, Icons, MaterialPageRoute, Navigator, Widget;

import 'package:bazaar/src/view.dart' as v;

import 'package:bazaar/src/controller.dart'
    show ControllerMVC, Prefs;

class ProductDetails extends ControllerMVC {

  factory ProductDetails() => _this ??= ProductDetails._();
  static ProductDetails _this;
  ProductDetails._();

  bool selected;
  v.ProductDetailsState state;

  @override
  void initState() {
    state = stateMVC;
    selected = Prefs.getBool(state.widget.productDetailsName);
  }

  @override
  void dispose() {
    Prefs.setBool(state.widget.productDetailsName, selected);
    super.dispose();
  }

  Widget get shopping => IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(stateMVC.context)
              .push(MaterialPageRoute(builder: (context) => v.Cart()));
        },
      );

  Widget get iconButton => IconButton(
        color: Color(0xFFB33771),
        icon: Icon(selected ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          selected = !selected;
          refresh();
        },
      );
}
