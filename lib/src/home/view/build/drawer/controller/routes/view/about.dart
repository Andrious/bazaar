import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BuildContext,
        Color,
        Colors,
        Column,
        Container,
        Divider,
        EdgeInsets,
        Expanded,
        FontWeight,
        Icon,
        Icons,
        Padding,
        Row,
        Scaffold,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

import 'package:flutter/painting.dart'
    show Alignment, Color, EdgeInsets, FontWeight, TextStyle;

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: const Text("About"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "e-Bazaar",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Text("Version 1.0.0"),
            const Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
            ),
            Row(
              children: <Widget>[
                const Icon(Icons.copyright),
                Expanded(
                    child: Text(" 2019, eBazaar.com, Inc or its affiliates.")),
              ],
            ),
            const Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
            ),
            Divider(
              height: 20.0,
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              alignment: Alignment.topLeft,
              child: const Text(
                "About eBazzar",
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                  "E-commerce is the activity of buying or selling of products on online services or over the Internet. Electronic commerce draws on technologies such as mobile commerce, electronic funds transfer, supply chain management, Internet marketing, online transaction processing, electronic data interchange (EDI), inventory management systems, and automated data collection systems."),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              alignment: Alignment.topLeft,
              child: const Text(
                "Privacy & Policy",
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                  "E-commerce is the activity of buying or selling of products on online services or over the Internet. Electronic commerce draws on technologies such as mobile commerce, electronic funds transfer, supply chain management, Internet marketing, online transaction processing, electronic data interchange (EDI), inventory management systems, and automated data collection systems."),
            )
          ],
        ),
      ),
    );
  }
}
