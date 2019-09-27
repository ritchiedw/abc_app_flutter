import 'package:abc_app_flutter/models/bin_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/address.dart';

class PostcodeSearch extends StatefulWidget {
  //Function raiseState

  @override
  _PostcodeSearchState createState() => _PostcodeSearchState();
}

class _PostcodeSearchState extends State<PostcodeSearch> {
  String postCode;
  Map<String, String> uprnAddress = {};
  String selectedUPRN;
  String binData = "";

  DropdownButton<String> androidDropdown() {
    print('androidDropdown');
    List<DropdownMenuItem<String>> dropdownItems = [];
    uprnAddress.forEach((k, v) {
      var newItem = DropdownMenuItem(
        child: Text(v),
        value: k,
      );
      dropdownItems.add(newItem);
    });

    return DropdownButton<String>(
      value: selectedUPRN,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedUPRN = value;
          //getData();
          getBinData();
          savePreference();
        });
      },
    );
  }

  Widget binDetails() {
    return Text(binData);
  }

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
        Container(
          height: 50.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 10.0),
          color: Colors.lightBlue,
          child: androidDropdown(),
        ),
        Container(
          height: 150.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 10.0),
          child: binDetails(),
        )
      ],
    );
  }

/*
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
*/
  void getData() async {
    //Map<String, String> uprnAddress = {};
    Address address = Address();
    List<dynamic> addressList = await address.getAddressFromPostcode(postCode);
    //print(addressList);
    print(addressList[0]);
    addressList.forEach((element) {
      print(element['attributes']['ADDRESS']);
      print(element['attributes']['UPRN']);
      String uprn = element['attributes']['UPRN'];
      String someAddress = element['attributes']['ADDRESS'];
      //uprnAddress[uprn] = thisAddress;
      uprnAddress.putIfAbsent(uprn, () => someAddress.substring(0, 30));
    });
    setState(() {});
    print(uprnAddress);
  }

  void getBinData() async {
    BinRoute binRoute = BinRoute();
    binData = await binRoute.getBinRouteFromUPRN(selectedUPRN);
    setState(() {});
  }

  void savePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('UPRN', selectedUPRN);
  }
}
