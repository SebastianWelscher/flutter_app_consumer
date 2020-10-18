import 'package:flutter/material.dart';
import 'package:flutter_app_consumer/model/consumer.dart';
import 'package:hive/hive.dart';
import 'package:flutter_app_consumer/dialogs/widget/customTextFormField.dart';
import 'package:uuid/uuid.dart';

class ConsumerInputDialog extends StatelessWidget {

  GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  var context;
  String _name;
  String _street;
  String _number;
  String _postalCode;
  String _town;

  var uuid = Uuid();

  ConsumerInputDialog({this.context});

  _saveContact(){

    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Box<Consumer> consumerBox = Hive.box('consumer');
      consumerBox.add(Consumer(name: _name,
          street: _street,
          number: _number,
          postalCode: _postalCode,
          town: _town,
          customerID: uuid.v4()));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: SimpleDialog(
        backgroundColor: Color(0xFFF3E5F5),
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
                Divider(color: Colors.blueAccent,thickness: 2,),
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
                          errorText: 'Namen eingeben',
                          keyboardType: TextInputType.text),
                      SizedBox(height: 10),
                        CustomTextFormField(
                            icon: Icon(Icons.home_outlined),
                            hintText: 'Straße',
                            labelText: 'Straße',
                            onSaved: (String street){
                              _street = street;
                            },
                            errorText: 'Straße eingeben',
                            keyboardType: TextInputType.text),
                      SizedBox(height: 10),
                      CustomTextFormField(
                          icon: Icon(Icons.home_outlined),
                          hintText: 'Hausnummer',
                          labelText: 'Hausnummer',
                          onSaved: (String number){
                            _number = number;
                          },
                          errorText: 'Hausnummer eingeben',
                          keyboardType: TextInputType.number),
                      SizedBox(height: 10),
                      CustomTextFormField(
                          icon: Icon(Icons.apps_sharp),
                          hintText: 'PLZ',
                          labelText: 'PLZ',
                          onSaved: (String postalCode){
                            _postalCode = postalCode;
                          },
                          errorText: 'Postleitzahl eingeben',
                          keyboardType: TextInputType.number),
                      SizedBox(height: 20),
                      CustomTextFormField(
                          icon: Icon(Icons.home_outlined),
                          hintText: 'Stadt',
                          labelText: 'Stadt',
                          onSaved: (String town){
                            _town = town;
                          },
                          errorText: 'Stadt eingeben',
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
      ),
    );
  }
}