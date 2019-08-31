import 'package:abc_app_flutter/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:abc_app_flutter/main_screen.dart';
import 'screens/subscription_screen.dart';

void main() => runApp(ABCApp());

class ABCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        "subscriptionPage": (context) => SubscriptionScreen(),
      },
    );
  }
}
