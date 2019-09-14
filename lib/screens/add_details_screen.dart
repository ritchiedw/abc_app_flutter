import 'package:abc_app_flutter/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import 'package:abc_app_flutter/helpers/consts.dart';

class AddDetailsScreen extends StatelessWidget {
  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  final firstNameTEC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    firstNameTEC.text = user.firstName;
    var firstName;

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
            Container(
              alignment: Alignment.center,
              child: Text(
                "User details",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (newFirstname) {
                  print(newFirstname);
                  firstName = newFirstname;
                },
                controller: firstNameTEC,
              ),
            ),
            FlatButton(
              onPressed: () {
                //Provider.of<UserData>(context).saveUser(User(firstName));
                print("Save Details");
                user.firstName = firstName;
                user.saveDetails();
              },
              child: Text("Add details"),
              color: Color(0xff1db15b),
            ),
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
