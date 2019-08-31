import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../helpers/database_helper.dart';
import 'user.dart';

class UserData extends ChangeNotifier {
  User user;

  UserData() {
    //Do database stuff:
    //if db exists
    //  open database
    //  read user record
    //  create user model
    //  notifyListeners of details
    //else
    //  create database
    //

    //Database db = DatabaseHelper().doDatabase();
  }

  void saveUser(User user) {
    this.user = user;
    //update database
    notifyListeners();
  }
}
