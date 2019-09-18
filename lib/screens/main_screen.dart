import 'package:abc_app_flutter/helpers/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:abc_app_flutter/screens/drawer.dart';
import 'package:abc_app_flutter/widgets/abc_appbar.dart';

import 'tab_one.dart';
import 'tab_three.dart';
import 'tab_two.dart';

class MainScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Center(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: ABCAppBarWithTabs(
              scaffoldKey: _scaffoldKey,
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TabOne(),
              TabTwo(),
              TabThree(),
            ],
          ),
          drawer: ABCDrawer(),
        ),
      ),
    );
  }
}
