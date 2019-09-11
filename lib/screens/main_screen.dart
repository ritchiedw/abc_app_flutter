import 'package:flutter/material.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';
import 'package:abc_app_flutter/screens/drawer.dart';

class MainScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: ABCAppBar(
              scaffoldKey: _scaffoldKey,
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text("Report It"),
                  onPressed: () {
                    print("Report It");
                  },
                  color: Color(0xff1db15b),
                ),
                FlatButton(
                  child: Text("Request It"),
                  onPressed: () {
                    print("Request It");
                  },
                  color: Color(0xff1db15b),
                ),
                FlatButton(
                  child: Text("Pay It"),
                  onPressed: () {
                    print("Pay It");
                    Navigator.pushNamed(context, "paymentScreen");
                  },
                  color: Color(0xff1db15b),
                ),
              ],
            ),
          ),
          drawer: ABCDrawer(),
        ),
      ),
    );
  }
}
