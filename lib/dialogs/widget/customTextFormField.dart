import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  Icon icon;
  String hintText;
  String labelText;

  Function onSaved;

  TextInputType keyboardType;

  CustomTextFormField(
       {@required this.icon, @required this.hintText, @required this.labelText,
        @required this.onSaved, @required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
      child: TextFormField(
          decoration: InputDecoration(
            icon: icon,
            hintText: hintText,
            labelText: labelText,
          ),
          keyboardType: TextInputType.text,
          onSaved: onSaved,
      ),
    );
  }
}