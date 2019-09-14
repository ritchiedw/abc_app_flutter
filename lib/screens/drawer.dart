import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class ABCDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("drawer.dart build");
    User user = Provider.of<User>(context);
    //user.init();
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(user.firstName ?? "Not Defined"),
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
