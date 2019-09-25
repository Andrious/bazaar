import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Color,
        Colors,
        Container,
        Divider,
        EdgeInsets,
        ListView,
        MaterialButton,
        Padding,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        Widget;

import 'package:bazaar/src/home/view/build/appbar/view/cart_product_details.dart'
    show CartProductDetails;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text("Cart"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text("Cart Subtotal (1 item): \$ 1100"),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 12.0, bottom: 20.0),
            child: MaterialButton(
              textColor: Colors.white,
              padding: const EdgeInsets.all(15.0),
              child: const Text("Proceed to Buy"),
              onPressed: () {},
              color: const Color(0xFFB33771),
            ),
          ),
          const Divider(
            height: 5.0,
            color: Colors.grey,
          ),
          Container(height: 400.0, child: CartProductDetails()),
        ],
      ),
    );
  }
}
