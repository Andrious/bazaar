import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        AssetImage,
        BoxFit,
        BuildContext,
        Color,
        Colors,
        Column,
        Container,
        Curves,
        EdgeInsets,
        Flexible,
        FontWeight,
        Icon,
        IconData,
        ListTile,
        Padding,
        Scaffold,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

import 'package:carousel_pro/carousel_pro.dart' show Carousel;

import 'package:bazaar/src/view.dart'
    show HomeDrawer, RecentProducts, StateMVC;

import 'package:bazaar/src/controller.dart' as c;

class HomePage extends StatefulWidget {
  final searchProdName;
  final searchProdImage;
  final searchProdPrice;

  HomePage({
    this.searchProdName,
    this.searchProdImage,
    this.searchProdPrice,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends StateMVC<HomePage> {
  HomePageState() : super(c.ThemeChanger()) {
    add(c.HomeDrawer());
    add(c.HomeAppBar());
  }

  @override
  Widget build(BuildContext context) {
    c.HomeAppBar con = controllerByType<c.HomeAppBar>(context);
    return Scaffold(
      // Drawer Start
      drawer: HomeDrawer(this),
      // Drawer ends
      appBar: AppBar(
        titleSpacing: 2.0,
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text("e-Bazaar"),
        actions: <Widget>[
          con.search,
          con.cart,
        ],
      ),
      body: Column(
        children: <Widget>[
          _imgCarousel(),
          // _categories(),
          // CategoryImages(),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Recent Products",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          //grid view
          const Flexible(
            child: const Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: RecentProducts(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imgCarousel() {
    return Container(
      height: 200.0,
      child: Carousel(
        overlayShadow: true,
        overlayShadowColors: Colors.black45,
        dotSize: 5.0,
        autoplay: true,
        animationCurve: Curves.bounceInOut,
        dotBgColor: Colors.transparent,
        boxFit: BoxFit.cover,
        images: [
          const AssetImage('images/c1.jpg'),
          const AssetImage('images/c5.jpg'),
          const AssetImage('images/c2.jpg'),
          const AssetImage('images/c3.jpg'),
          const AssetImage('images/c4.jpg'),
          const AssetImage('images/c6.jpg'),
        ],
      ),
    );
  }

  Widget showList(String s, IconData i) {
    return ListTile(
      leading: Icon(
        i,
        color: Colors.yellow[700],
      ),
      title: Text(s),
    );
  }
}
