//import 'package:auth/auth.dart' show Auth;

import 'package:bazaar/src/controller.dart'
    show BazaarApp, StateXController, ThemeChanger;

import 'package:bazaar/src/view.dart'
    show
        About,
        App,
        AppStateExtension,
        BoxDecoration,
        CircleAvatar,
        Color,
        Colors,
        Contact,
        FontWeight,
        GestureDetector,
        HomePageState,
        Icons,
        Image,
        InkWell,
        ListTile,
        MaterialPageRoute,
        MyAccount,
        MyOrders,
        Navigator,
        Settings,
        Switch,
        Text,
        TextStyle,
        UserAccountsDrawerHeader,
        Widget;

///
class HomeDrawer extends StateXController {
  ///
  factory HomeDrawer() => _this ?? HomeDrawer._();
  HomeDrawer._();
  static HomeDrawer? _this;

  late HomePageState _state;
  late ThemeChanger _theme;
//  late Auth _auth;
  late BazaarApp _con;

  late bool _darkmode;

  @override
  void initState() {
    super.initState();
    _con = BazaarApp();
//    _auth = _con.auth;
    _state = state as HomePageState;
    _theme = ThemeChanger();
    _darkmode = _theme.darkMode;
    // Load the Ad into memory.
//    _con.ads.setBannerAd();
  }

  ///
  String userName() {
    String name = ''; //_auth.displayName.trim();
    if (name.isEmpty) {
      name = ''; //_auth.email;
      final List<String> parts = name.split('@');
      if (parts.isNotEmpty) {
        name = parts[0];
      }
    }
    return name;
  }

  ///
  String email() {
    String email = ''; //_auth.email;
    if (email.isEmpty) {
      email = 'No Email Address';
    }
    return email;
  }

  ///
  String photoUrl() {
    return 'A';

    // if (_auth.photoUrl != null && _auth.photoUrl.isNotEmpty) {
    //   return _auth.photoUrl;
    // } else {
    //   return 'A';
    // }
  }

  ///
  void onTap(Widget widget) {
    // _con.ads.bannerAd?.show();
    // Navigator.of(_state.context)
    //     .push(MaterialPageRoute<void>(builder: (context) => widget))
    //     .then((_) {
    //   _con.ads.closeBannerAd();
    // });

    Navigator.of(_state.context)
        .push(MaterialPageRoute<void>(builder: (context) => widget));
    setState(() {});
  }

  ///
  Widget get header => UserAccountsDrawerHeader(
        decoration: const BoxDecoration(
          color: Color(0xFFB33771),
        ),
        accountName: Text(userName()),
        accountEmail: Text(email()),
        currentAccountPicture: GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text(photoUrl(),
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      );

  ///
  Widget get darkmode => ListTile(
        leading: _darkmode
            ? Image.asset(
                'images/moon.png',
                height: 30,
                width: 26,
              )
            : Image.asset(
                'images/sunny.png',
                height: 30,
                width: 26,
              ),
        title: const Text('DarkMode'),
        trailing: Switch(
          value: _darkmode,
          onChanged: (val) {
            _darkmode = val;
            _theme.setDarkMode(dark: _darkmode);
            // To display the switch button change
            setState(() {});
            // To display the 'dark mode' change for the whole app.
            App.setState(() {});
          },
        ),
      );

  ///
  Widget get account => InkWell(
        onTap: () {
          onTap(const MyAccount());
        },
        child: _state.showList(
          'My Account',
          Icons.account_box,
        ),
      );

  ///
  Widget get orders => InkWell(
        onTap: () {
          onTap(const MyOrders());
        },
        child: _state.showList(
          'My Orders',
          Icons.shopping_basket,
        ),
      );

  ///
  Widget get settings => InkWell(
        onTap: () {
          onTap(const Settings());
        },
        child: _state.showList(
          'Settings',
          Icons.settings,
        ),
      );

  ///
  Widget get about => InkWell(
        onTap: () {
          onTap(const About());
        },
        child: _state.showList(
          'About',
          Icons.adjust,
        ),
      );

  ///
  Widget get contact => InkWell(
        onTap: () {
          onTap(Contact());
        },
        child: _state.showList(
          'Contact',
          Icons.contact_phone,
        ),
      );

  ///
  Widget get logout => InkWell(
        onTap: () {
          // _auth.signOut().then((value) {
          //   Navigator.of(_state.context).pop();
          //   Navigator.pushReplacement(_state.context,
          //       MaterialPageRoute<void>(builder: (context) => const Login()));
          //   _state.refresh();
          // });
        },
        child: _state.showList(
          'LogOut',
          Icons.exit_to_app,
        ),
      );
}
