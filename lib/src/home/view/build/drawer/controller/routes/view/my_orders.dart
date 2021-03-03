import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Color,
        Container,
        Key,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;

import 'package:bazaar/src/view.dart' show CartProductDetails;

class MyOrders extends StatelessWidget {
  const MyOrders({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text('My Orders'),
      ),
      body: Container(
        height: 400,
        child: const CartProductDetails(),
      ),
    );
  }
}
