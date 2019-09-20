import 'package:flutter/material.dart' show runApp;

import 'package:mvc_application/mvc.dart' show App;

import 'package:bazaar/src/view.dart' show App, BazaarApp;

void main() {
  runApp(MyApp());
}

class MyApp extends App {
  @override
  createView() => BazaarApp();
}



