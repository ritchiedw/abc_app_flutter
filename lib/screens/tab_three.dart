import 'package:flutter/material.dart';

import '../helpers/bin_data.dart';

class TabThree extends StatefulWidget {
  @override
  _TabThreeState createState() => _TabThreeState();
}

class _TabThreeState extends State<TabThree> {
  String postCode;
  BinData bd = BinData();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (newValue) => postCode = newValue,
        ),
        MaterialButton(
          child: Text('Search'),
          onPressed: () => bd.getAddressData(postCode),
        ),
        Container(),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

/*

bool isWaiting = false;
  void getData() async {
    try {
      print("getData");
      isWaiting = true;
      Map data =
      isWaiting = false;
      setState(() {
        cryptoData = data;
      });
    } catch (e) {
      print(e);
    }


class TabThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(),
      ],
    );
  }
}
*/
