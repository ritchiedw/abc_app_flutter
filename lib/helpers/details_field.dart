import 'package:abc_app_flutter/helpers/consts.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController textController;
  String hintText;
  String fieldText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: kTextFieldDecoration.copyWith(
          hintText: 'Enter your first name',
        ),
        textAlign: TextAlign.center,
        onChanged: (newFieldText) {
          //print(newFirstname);
          fieldText = newFieldText;
        },
        controller: textController,
      ),
    );
  }
}
