import 'package:bazaar/src/controller.dart' show ControllerMVC, Prefs;
import 'package:bazaar/src/view.dart' as v;
import 'package:flutter/material.dart'
    show Color, Icon, IconButton, Icons, MaterialPageRoute, Navigator, Widget;

///
class ProductDetails extends ControllerMVC {
  ///
  factory ProductDetails() => _this ??= ProductDetails._();
  ProductDetails._();
  static ProductDetails? _this;

  ///
  late bool selected;

  ///
  late v.ProductDetailsState _state;

  @override
  void initState() {
    super.initState();
    _state = stateMVC as v.ProductDetailsState;
    selected = Prefs.getBool(_state.widget.productDetailsName);
  }

  @override
  void deactivate() {
    Prefs.setBool(_state.widget.productDetailsName, selected);
  }

  ///
  Widget get shopping => IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(_state.context).push(
              MaterialPageRoute<void>(builder: (context) => const v.Cart()));
        },
      );

  ///
  Widget get iconButton => IconButton(
        color: const Color(0xFFB33771),
        icon: Icon(selected ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          selected = !selected;
          refresh();
        },
      );
}
