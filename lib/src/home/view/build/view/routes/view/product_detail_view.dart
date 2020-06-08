import 'package:flutter/material.dart'
    show
        AlertDialog,
        AppBar,
        BuildContext,
        Color,
        Colors,
        Container,
        EdgeInsets,
        Expanded,
        FlatButton,
        FontWeight,
        Icon,
        IconButton,
        Icons,
        Image,
        ListTile,
        ListView,
        MainAxisAlignment,
        MaterialButton,
        Navigator,
        Padding,
        Row,
        Scaffold,
        StatefulWidget,
        Text,
        TextDecoration,
        TextStyle,
        Widget,
        showDialog;

import 'package:bazaar/src/view.dart' show SimilarProducts, StateMVC;

import 'package:bazaar/src/controller.dart' as c;

class ProductDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsImage;
  final productDetailsoldPrice;
  final productDetailsPrice;
  final productDetailsDesc;

  ProductDetails(
      {this.productDetailsName,
      this.productDetailsImage,
      this.productDetailsoldPrice,
      this.productDetailsPrice,
      this.productDetailsDesc});

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends StateMVC<ProductDetails> {
  ProductDetailsState() : super(c.ProductDetails()) {
    con = controller;
  }
  c.ProductDetails con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text("e-Bazaar"),
        actions: <Widget>[
          con.shopping,
        ],
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  "${widget.productDetailsName}",
                  style: TextStyle(
                      color: const Color(0xFFB33771),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: con.iconButton,
              ),
            ],
          ),
          Container(
            height: 300.0,
            child: Image.asset(
              widget.productDetailsImage,
              // fit: BoxFit.cover,
            ),
          ),
          // --------------- Size , Color ,Quantity Buttons------------------
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      const Text("Size"),
                      IconButton(
                        onPressed: () {
                          _showDialog("Size", "Choose Size");
                        },
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      const Text("Color"),
                      IconButton(
                        onPressed: () {
                          _showDialog("Color", "Choose Color");
                        },
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      const Text("Qty"),
                      IconButton(
                        onPressed: () {
                          _showDialog("Quantity", "Choose Quantity");
                        },
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ------------------- Price Details ------------------

          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              children: <Widget>[
                const Text("M.R.P. :  "),
                Text(
                  " \$ ${widget.productDetailsoldPrice}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              children: <Widget>[
                const Text("Price :  "),
                Text(
                  " \$ ${widget.productDetailsPrice}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              children: <Widget>[
                const Text("You Save :  "),
                Text(
                  " \$ ${widget.productDetailsoldPrice - widget.productDetailsPrice} Inclusive all taxes",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          //  ---------------------- Buy Now and Add to Cart Buttons ------------

          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: MaterialButton(
              textColor: Colors.white,
              padding: const EdgeInsets.all(15.0),
              child: const Text("Buy Now"),
              onPressed: () {},
              color: const Color(0xFFB33771),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
            child: MaterialButton(
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              child: const Text("Add to Cart"),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Product added to the Cart"),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text("OK"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    });
              },
              color: const Color(0xFFB33771),
            ),
          ),

          // -------- About this Item ------------
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 20.0, bottom: 20.0),
            child: ListTile(
              title: const Text(
                "About this Item",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text("${widget.productDetailsDesc}"),
              ),
            ),
          ),
          Padding(
            child: const Text(
              "Similar Products",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
          ),
          Container(
            height: 400.0,
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }

  _showDialog(String s, String c) {
    var _alert = AlertDialog(
      title: Text(s),
      content: Text(c),
      actions: <Widget>[
        FlatButton(
          child: const Text("Close"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => _alert);
  }
}
