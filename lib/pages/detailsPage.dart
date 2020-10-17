import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  String name;
  String address;

  DetailsPage({@required this.name,@required this.address});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=> Navigator.pop(context),
          ),
        ),
        body: Container(),

    );
  }
}