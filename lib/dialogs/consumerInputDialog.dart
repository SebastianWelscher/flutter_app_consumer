import 'package:flutter/material.dart';
import 'package:flutter_app_consumer/model/consumer.dart';
import 'package:hive/hive.dart';
import 'package:flutter_app_consumer/dialogs/widget/customTextFormField.dart';

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
        color: Colors.blue,
      ),
      children: [
        Container(
          width: 600,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                        icon: Icon(Icons.perm_identity_outlined),
                        hintText: 'Name',
                        labelText: 'Name',
                        onSaved: (String name){
                          _name = name;
                        },
                        keyboardType: TextInputType.text),
                    SizedBox(height: 20),
                      CustomTextFormField(
                          icon: Icon(Icons.home_outlined),
                          hintText: 'Addresse',
                          labelText: 'Adresse',
                          onSaved: (String address){
                            _address = address;
                          },
                          keyboardType: TextInputType.text),
                    SizedBox(height: 20),
                    CustomTextFormField(
                        icon: Icon(Icons.confirmation_number_outlined),
                        hintText: 'CustomerID',
                        labelText: 'CustomerID',
                        onSaved: (String customerID){
                          _customerID = customerID;
                        },
                        keyboardType: TextInputType.text),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                            child: Text('Zurück'),
                            onPressed: ()=> Navigator.pop(context),),
                        OutlineButton(
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