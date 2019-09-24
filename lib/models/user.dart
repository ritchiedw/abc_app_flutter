import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User with ChangeNotifier {
  String firstName;
  //String postCode;

  bool isWaiting = false;

  User() {
    getDetails();
  }

  void saveDetails() async {
    print("saveDetails()");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    notifyListeners();
  }

  void getDetails() async {
    print("getDetails()");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstName = prefs.getString('firstName') ?? 'Not Defined';
    print("firstname: $firstName");
    notifyListeners();
  }

  void clearDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }
}
