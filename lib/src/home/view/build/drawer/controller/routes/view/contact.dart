import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BuildContext,
        Center,
        Color,
        Column,
        Container,
        EdgeInsets,
        Expanded,
        FontWeight,
        GestureDetector,
        Image,
        ListTile,
        Padding,
        Row,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

import 'package:url_launcher/url_launcher.dart' show canLaunch, launch;

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text("Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              alignment: Alignment.topLeft,
              child: const Text(
                "Questions about an issue?",
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Text("Feel free to Ask!"),
            const SizedBox(height: 50.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _launchTwitter();
                    },
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/twitter.png',
                        height: 70.0,
                        width: 70.0,
                      ),
                      subtitle: Center(
                        child: const Text(
                          "Twitter",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _launchgithub();
                    },
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/github.png',
                        height: 70.0,
                        width: 70.0,
                      ),
                      subtitle: Center(
                        child: const Text(
                          "Github",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _launchlinkedIn();
                    },
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/linkedin.png',
                        height: 70.0,
                        width: 70.0,
                      ),
                      subtitle: const Center(
                        child: const Text(
                          "LinkedIn",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchTwitter() async {
    const url = 'https://twitter.com/_iamramu';
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchgithub() async {
    const url = 'https://github.com/bugudiramu';
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchlinkedIn() async {
    const url = 'https://www.linkedin.com/in/bugudi-ramu-2a5a5a161/';
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
