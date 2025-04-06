import 'package:bazaar/src/controller.dart' as c;

import 'package:bazaar/src/view.dart'
    show HomeDrawer, Image, RecentProducts, StateX;

// import 'package:carousel_pro/carousel_pro.dart' show Carousel;

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BuildContext,
        Color,
        Colors,
        Column,
        Container,
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

///
class HomePage extends StatefulWidget {
  ///
  const HomePage({
    Key? key,
    this.searchProdName,
    this.searchProdImage,
    this.searchProdPrice,
  }) : super(key: key);

  ///
  final String? searchProdName;

  ///
  final String? searchProdImage;

  ///
  final double? searchProdPrice;

  @override
  HomePageState createState() => HomePageState();
}

///
class HomePageState extends StateX<HomePage> {
  ///
  HomePageState() : super(controller: c.ThemeChanger()) {
    add(c.HomeDrawer());
    add(c.HomeAppBar());
  }

  @override
  Widget buildAndroid(BuildContext context) {
    final con = controllerByType<c.HomeAppBar>()!;
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
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
        ),
        carouselController: CarouselSliderController(),
        items: [
          Image.asset('images/c1.jpg'),
          Image.asset('images/c5.jpg'),
          Image.asset('images/c2.jpg'),
          Image.asset('images/c3.jpg'),
          Image.asset('images/c4.jpg'),
          Image.asset('images/c6.jpg'),
        ],
      ),
    );
  }

  ///
  Widget showList(String s, IconData i) {
    return ListTile(
      leading: Icon(
        i,
        color: Colors.yellow[700],
      ),
      title: Text(s),
    );
  }

  // The Cupertino interface was not implemented.
  @override
  Widget buildiOS(BuildContext context) => buildAndroid(context);
}
