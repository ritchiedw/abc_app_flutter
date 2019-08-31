import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';

class PaymentScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: ABCAppBar(
          scaffoldKey: _scaffoldKey,
        ),
      ),
      body: Container(
        child: Text("I am the payment screen"),
      ),
    );
    //return Container(
    //  child: Text("I am the payment screen"),
    //);
  }
}
