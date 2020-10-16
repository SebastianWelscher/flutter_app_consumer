import 'package:flutter/material.dart';
import 'package:flutter_app_consumer/model/consumer.dart';
import 'package:hive/hive.dart';

class ConsumerInputDialog extends StatelessWidget {

  GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  var context;
  String _name;
  String _address;
  String _customerID;

  ConsumerInputDialog({this.context});

  _saveContact(){
    _formKey.currentState.save();
    Box<Consumer> consumerBox = Hive.box('consumer');
    consumerBox.add(Consumer(name: _name,address: _address,customerID: _customerID));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return SimpleDialog(
      title: Text('Kontakt hinzufügen'),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      children: [
        Container(
          width: 400,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.create),
                                hintText: 'Name der Person',
                                labelText: 'Name',
                              ),
                          keyboardType: TextInputType.text,
                          onSaved: (String name){
                          _name = name;
                          }
                        ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.create),
                                hintText: 'Addresse',
                                labelText: 'Addresse',
                              ),
                          keyboardType: TextInputType.text,
                          onSaved: (String address){
                          _address = address;
                          }
                        ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.confirmation_number_outlined),
                                hintText: 'ID',
                                labelText: 'ID',
                              ),
                          keyboardType: TextInputType.text,
                          onSaved: (String customerID){
                          _customerID = customerID;
                          }
                        ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                            child: Text('Zurück'),
                            onPressed: ()=> Navigator.pop(context),),
                        SimpleDialogOption(
                          child: Text('Hinzufügen'),
                          onPressed: _saveContact,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

