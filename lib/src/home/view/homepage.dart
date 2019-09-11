//import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:provider/provider.dart';
import 'package:shopping_cart/src/blocs/themeChanger.dart';

import 'package:shopping_cart/src/home/build/drawer/view/about.dart';

import 'package:shopping_cart/src/home/build/appbar/view/cart.dart';
import 'package:shopping_cart/src/home/build/drawer/view/contact.dart';

import 'package:shopping_cart/src/login/view/loginPage.dart';

import 'package:shopping_cart/src/home/build/drawer/view/myAccount.dart';
import 'package:shopping_cart/src/home/build/drawer/view/myOrders.dart';
import 'package:shopping_cart/src/home/build/drawer/view/settings.dart';

import 'package:shopping_cart/src/home/view/recent_products.dart';

import 'package:shopping_cart/src/model.dart';

import 'package:shopping_cart/src/view.dart';

import 'package:shopping_cart/src/controller.dart' as c;



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

  HomePageState():super(ThemeChanger(ThemeData.light())){
    add(c.HomeDrawer());
    add(c.HomeAppBar());
  }

  bool darkmode = false;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseUser currentUser;
  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    firebaseAuth.currentUser().then((FirebaseUser user) {
      setState(() {
        // call setState to rebuild the view
        this.currentUser = user;
      });
    });
  }

  String userName() {
    if (currentUser != null) {
      if (currentUser.displayName == null) {
        return currentUser.email.replaceAll('@gmail.com', '');
      }
      return currentUser.displayName;
    } else {
      return "";
    }
  }

  String email() {
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "No Email Address";
    }
  }

  String photoUrl() {
    if (currentUser != null) {
      return currentUser.email[0].toUpperCase();
    } else {
      return "A";
    }
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
        backgroundColor: Color(0xFFB33771),
        title: Text("e-Bazaar"),
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
            child: Text(
              "Recent Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          //grid view
          Flexible(
            child: Padding(
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