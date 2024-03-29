import 'package:flutter/material.dart';

class ABCDrawer extends StatelessWidget {
  const ABCDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            title: Text('Subscriptions'),
            onTap: () {
              print("onTap Item 1");
              Navigator.pop(context);
              Navigator.pushNamed(context, "subscriptionScreen");
            },
          ),
          ListTile(
            title: Text('User details'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.pushNamed(context, "addDetailsScreen");
            },
          ),
        ],
      ),
    );
  }
}
