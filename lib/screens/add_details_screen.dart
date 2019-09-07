import 'package:abc_app_flutter/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../models/user_data.dart';
import 'package:abc_app_flutter/helpers/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDetailsScreen extends StatefulWidget {
  @override
  _AddDetailsScreenState createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String firstName;
  String lastName;
  var txtFirstName = TextEditingController();
  var txtLastName = TextEditingController();

  @override
  void initState() {
    print("initState()");
    super.initState();
    getDetails();
  }

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
              controller: txtFirstName,
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
              controller: txtLastName,
            ),
            FlatButton(
              onPressed: () {
                //Provider.of<UserData>(context).saveUser(User(firstName));
                saveDetails(firstName, lastName);
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

  void saveDetails(String firstName, String lastName) async {
    print("saveDetails()");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
  }

  bool isWaiting = false;

  void getDetails() async {
    print("getDetails()");
    isWaiting = true;
    //var returnMap = Map<String, String>();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs);
    isWaiting = false;
    setState(() {
      print("setState()");
      firstName = prefs.getString('firstName');
      print("firstname: $firstName");
      lastName = prefs.getString('lastName');
      print("lastName: $lastName");
      txtFirstName.text = firstName;
      txtLastName.text = lastName;
    });
  }
}
