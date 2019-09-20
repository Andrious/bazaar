import 'package:flutter/material.dart'
    show BuildContext, Drawer, ListView, StatelessWidget, Widget;

import 'package:bazaar/src/view.dart' hide HomeDrawer;

import 'package:bazaar/src/controller.dart' as c;

class HomeDrawer extends StatelessWidget {
  HomeDrawer(this.state);

  final HomePageState state;

  Widget build(BuildContext context) {
    c.HomeDrawer con = state.controllerByType<c.HomeDrawer>();
    return Drawer(
      child: ListView(
        children: <Widget>[
          con.header,
          con.darkmode,
          con.account,
          con.orders,
          con.settings,
          con.about,
          con.contact,
          con.logout,
        ],
      ),
    );
  }
}
