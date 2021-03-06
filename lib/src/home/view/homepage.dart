import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        AssetImage,
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
        Key,
        ListTile,
        Padding,
        Scaffold,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

import 'package:carousel_pro/carousel_pro.dart' show Carousel;

import 'package:bazaar/src/view.dart' show HomeDrawer, RecentProducts, StateMVC;

import 'package:bazaar/src/controller.dart' as c;

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    this.searchProdName,
    this.searchProdImage,
    this.searchProdPrice,
  }) : super(key: key);

  final searchProdName;
  final searchProdImage;
  final searchProdPrice;

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
    final c.HomeAppBar con = c.HomeAppBar();
    return Scaffold(
      // Drawer Start
      drawer: HomeDrawer(state: this),
      appBar: AppBar(
        titleSpacing: 2,
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text('e-Bazaar'),
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
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Recent Products',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          //grid view
          const Flexible(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: RecentProducts(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imgCarousel() {
    return Container(
      height: 200,
      child: Carousel(
        overlayShadow: true,
        overlayShadowColors: Colors.black45,
        dotSize: 5,
        animationCurve: Curves.bounceInOut,
        dotBgColor: Colors.transparent,
        images: const [
          AssetImage('images/c1.jpg'),
          AssetImage('images/c5.jpg'),
          AssetImage('images/c2.jpg'),
          AssetImage('images/c3.jpg'),
          AssetImage('images/c4.jpg'),
          AssetImage('images/c6.jpg'),
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
