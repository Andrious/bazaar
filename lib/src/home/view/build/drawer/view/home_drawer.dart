import 'package:bazaar/src/view.dart' hide HomeDrawer;

import 'package:bazaar/src/controller.dart' as c;

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key key, this.state}) : super(key: key);

  final HomePageState state;

  @override
  Widget build(BuildContext context) {
    final c.HomeDrawer con = state.controllerByType<c.HomeDrawer>();
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
