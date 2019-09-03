import 'package:abc_app_flutter/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../models/user_data.dart';
import 'package:abc_app_flutter/helpers/consts.dart';

class AddDetailsScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String firstName;
    String lastName;

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: ABCAppBar(
          scaffoldKey: _scaffoldKey,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("User details"),
            TextField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your first name',
              ),
              textAlign: TextAlign.center,
              onChanged: (newFirstname) {
                print(newFirstname);
                firstName = newFirstname;
              },
            ),
            Text("Last name"),
            TextField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your last name',
              ),
              textAlign: TextAlign.center,
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
      drawer: ABCDrawer(),
    );
    //return Container(
    //  child: Text("I am the payment screen"),
    //);
  }
}
