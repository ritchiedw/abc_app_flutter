import 'package:abc_app_flutter/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:abc_app_flutter/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'models/user_data.dart';
import 'screens/add_details_screen.dart';
import 'screens/subscription_screen.dart';

void main() => runApp(ABCApp());

class ABCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => UserData(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
            primaryColor: Color(
              0xff017cc1,
            ),
            accentColor: Color(
              0xff01db15b,
            )),
        initialRoute: "home",
        routes: {
          "home": (context) => MainScreen(),
          "paymentScreen": (context) => PaymentScreen(),
          "subscriptionScreen": (context) => SubscriptionScreen(),
          "addDetailsScreen": (context) => AddDetailsScreen(),
        },
      ),
    );
  }
}
