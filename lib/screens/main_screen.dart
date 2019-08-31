import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';

class MainScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: ABCAppBar(
          scaffoldKey: _scaffoldKey,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              child: Text("Report It"),
              onPressed: () {
                print("Report It");
              },
              color: Color(0xff1db15b),
            ),
            FlatButton(
              child: Text("Request It"),
              onPressed: () {
                print("Request It");
              },
              color: Color(0xff1db15b),
            ),
            FlatButton(
              child: Text("Pay It"),
              onPressed: () {
                print("Pay It");
                Navigator.pushNamed(context, "paymentScreen");
              },
              color: Color(0xff1db15b),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                print("onTap Item 1");
                Navigator.pop(context);
                Navigator.pushNamed(context, "subscriptionPage");
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
