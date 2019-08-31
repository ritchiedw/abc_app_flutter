import 'package:flutter/foundation.dart';

import 'user.dart';

class UserData extends ChangeNotifier {
  void saveUser(User user) {
    notifyListeners();
  }
}
