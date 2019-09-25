import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Color,
        Container,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;

import 'package:bazaar/src/view.dart' show CartProductDetails;

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text("My Orders"),
      ),
      body: Container(
        height: 400.0,
        child: CartProductDetails(),
      ),
    );
  }
}
