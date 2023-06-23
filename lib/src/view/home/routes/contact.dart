import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BuildContext,
        Center,
        Color,
        Colors,
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

import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl;

/// Customer contact
class Contact extends StatelessWidget {
  ///
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text('Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 8),
              alignment: Alignment.topLeft,
              child: const Text(
                'Questions about an issue?',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Text('Feel free to Ask!'),
            const SizedBox(height: 50),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: _launchTwitter,
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/twitter.png',
                        height: 70,
                        width: 70,
                      ),
                      subtitle: const Center(
                        child: Text(
                          'Twitter',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _launchgithub,
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/github.png',
                        height: 70,
                        width: 70,
                      ),
                      subtitle: const Center(
                        child: Text(
                          'Github',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _launchlinkedIn,
                    child: ListTile(
                      title: Image.asset(
                        'images/logos/linkedin.png',
                        height: 70,
                        width: 70,
                      ),
                      subtitle: const Center(
                        child: Text(
                          'LinkedIn',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Column(
              children: <Widget>[
                Text('OR Email me at :'),
                Text('ramubugudi4@gmail.com',
                    style: TextStyle(color: Colors.blueGrey))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchTwitter() async {
    final uri = Uri.http('twitter.com', '_iamramu');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      const url = 'https://twitter.com/_iamramu';
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchgithub() async {
    final uri = Uri.http('github.com', 'bugudiramu');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      const url = 'https://github.com/bugudiramu';
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchlinkedIn() async {
    final uri = Uri.http('linkedin.com', 'in/bugudi-ramu-2a5a5a161');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      const url = 'https://www.linkedin.com/in/bugudi-ramu-2a5a5a161/';
      throw Exception('Could not launch $url');
    }
  }
}
