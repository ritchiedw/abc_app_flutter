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
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String addressLine4;
  String postcode;
  var txtFirstName = TextEditingController();
  var txtLastName = TextEditingController();
  var txtAddressLine1 = TextEditingController();
  var txtAddressLine2 = TextEditingController();
  var txtAddressLine3 = TextEditingController();
  var txtAddressLine4 = TextEditingController();
  var txtPostcode = TextEditingController();

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
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'First name',
                ),
                textAlign: TextAlign.center,
                onChanged: (newFirstname) {
                  print(newFirstname);
                  firstName = newFirstname;
                },
                controller: txtFirstName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Last name',
                ),
                textAlign: TextAlign.center,
                onChanged: (newLastname) {
                  print(newLastname);
                  lastName = newLastname;
                },
                controller: txtLastName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Address line 1',
                ),
                textAlign: TextAlign.center,
                onChanged: (newAddressLine1) {
                  addressLine1 = newAddressLine1;
                },
                controller: txtAddressLine1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Address Line 2',
                ),
                textAlign: TextAlign.center,
                onChanged: (newAddressLine2) {
                  addressLine2 = newAddressLine2;
                },
                controller: txtAddressLine2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Address Line 3',
                ),
                textAlign: TextAlign.center,
                onChanged: (newAddressLine3) {
                  //print(newFirstname);
                  addressLine3 = newAddressLine3;
                },
                controller: txtFirstName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Address Line 4',
                ),
                textAlign: TextAlign.center,
                onChanged: (newAddressLine4) {
                  //print(newFirstname);
                  addressLine4 = newAddressLine4;
                },
                controller: txtAddressLine4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Postcode',
                ),
                textAlign: TextAlign.center,
                onChanged: (newPostcode) {
                  postcode = newPostcode;
                },
                controller: txtPostcode,
              ),
            ),
            SizedBox(
              width: 88.0,
              child: FlatButton(
                onPressed: () {
                  //Provider.of<UserData>(context).saveUser(User(firstName));
                  print("I'm tapped out");
                  saveDetails(firstName, lastName);
                },
                child: Text("Add details"),
                color: Color(0xff1db15b),
              ),
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
