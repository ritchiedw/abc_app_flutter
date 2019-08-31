import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';

class AddDetailsScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
              },
            ),
            Text("Last name"),
            TextField(
              onChanged: (newLastname) {
                print(newLastname);
              },
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
