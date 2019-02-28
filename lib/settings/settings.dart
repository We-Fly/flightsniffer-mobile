import 'package:wefly/FloatingActionButton/fab_bottom_app_bar.dart';
import 'package:wefly/FloatingActionButton/layout.dart';
import 'package:wefly/SideBar/AppDrawer.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  // tag to main
  static String tag = 'settings-page';
  Settings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Settings createState() => new _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Center(),
      /* the body goes here */
      body: _Body(context),
    );
  }

  // functions

  // function to run as soon as app opens
  void initState() {}

  Widget _Body(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("data")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("data 2")
                  ],

                )
              ],
            ),
            Row(

            )
          ],
        ),
    ));
  }
}