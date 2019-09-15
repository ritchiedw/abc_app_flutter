import 'package:flutter/material.dart';

class TabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
