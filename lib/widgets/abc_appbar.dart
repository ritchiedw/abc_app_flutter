import 'package:flutter/material.dart';

class ABCAppBar extends StatelessWidget {
  const ABCAppBar({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(
        0xff017cc1,
      ),
      leading: IconButton(
        icon: Icon(Icons.menu),
        tooltip: 'Navigation menu',
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
      title: Text('Argyll and Bute Council'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Search',
          onPressed: null,
        ),
      ],
    );
  }
}
