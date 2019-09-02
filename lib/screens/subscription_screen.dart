import 'package:abc_app_flutter/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';

class SubscriptionScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: Text("I am the subscription screen"),
      ),
      drawer: ABCDrawer(),
    );
  }
}
