import 'package:flutter/material.dart';

import '../models/address.dart';

class PostcodeSearch extends StatefulWidget {
  @override
  _PostcodeSearchState createState() => _PostcodeSearchState();
}

class _PostcodeSearchState extends State<PostcodeSearch> {
  String postCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            textAlign: TextAlign.center,
            onChanged: (newPostcode) {
              print(newPostcode);
              postCode = newPostcode;
            },
          ),
        ),
        FlatButton(
          onPressed: () {
            //Provider.of<UserData>(context).saveUser(User(firstName));
            print("Search Postcode");
            getData();
            //Address address = Address();
            //address.getAddressFromPostcode(postCode);
            //user.firstName = firstName;
            //user.saveDetails();
          },
          child: Text("Search Postcode"),
          color: Color(0xff1db15b),
        ),
      ],
    );
  }

  DropdownButton<String> getDropdown() {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];
    for (String address in addressList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);gR
    }
  }

  void getData() async {
    Address address = Address();
    address.getAddressFromPostcode(postCode);
  }
}
