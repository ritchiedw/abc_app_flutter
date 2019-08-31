import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../models/user_data.dart';

class AddDetailsScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String firstName;
    String lastName;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: ABCAppBar(
          scaffoldKey: _scaffoldKey,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("User details"),
            Text("First name"),
            TextField(
              onChanged: (newFirstname) {
                print(newFirstname);
                firstName = newFirstname;
              },
            ),
            Text("Last name"),
            TextField(
              onChanged: (newLastname) {
                print(newLastname);
                lastName = newLastname;
              },
            ),
            FlatButton(
              onPressed: () {
                Provider.of<UserData>(context).saveUser(User(firstName));
              },
              child: Text("Add details"),
            )
          ],
        ),
      ),
    );
    //return Container(
    //  child: Text("I am the payment screen"),
    //);
  }
}
