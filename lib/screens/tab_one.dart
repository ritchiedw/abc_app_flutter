import 'package:abc_app_flutter/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../widgets/postcode_search.dart';

class TabOne extends StatelessWidget {
  final firstNameTEC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    firstNameTEC.text = user.firstName;
    var firstName;
    var postCode;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              onChanged: (newPostcode) {
                print(newPostcode);
                postCode = newPostcode;
              },
            ),
            PostcodeSearch(),
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
    );
  }
}
