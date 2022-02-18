import 'package:flutter/material.dart';
import 'package:otpscreen/mail/mail_screen.dart';

import 'google_code.dart';

class Chrom extends StatefulWidget {
  @override
  _ChromState createState() => _ChromState();
}

class _ChromState extends State<Chrom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("google"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              signInWithGoogle();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmailPage(),
                  ));
            },
            child: Text("google"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("google"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("google"),
          ),
        ],
      ),
    );
  }
}
