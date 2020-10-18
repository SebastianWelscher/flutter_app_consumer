import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {

  String name;
  String street;
  String number;
  String postalCode;
  String town;
  String customerID;

  DetailsPage({@required this.name,
               @required this.street,
               @required this.number,
               @required this.postalCode,
               @required this.town,
               @required this.customerID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(name, style: GoogleFonts.montserrat(
            fontSize: 22,
            color: Colors.blueAccent,
          ),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
            color: Colors.blueAccent,),
            onPressed: ()=> Navigator.pop(context),
          ),
          backgroundColor: Color(0xfffff8f7),
        ),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text('Addresse'),
              Center(
                child: Container(
                  padding: EdgeInsets.all(0),
                  height: 107,
                  width: 300,
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(street + number,style: GoogleFonts.comfortaa(
                            fontSize: 18,
                          ),),
                          SizedBox(height: 4,),
                          Text(postalCode + town,style: GoogleFonts.comfortaa(
                            fontSize: 18,
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text('CustomerID'),
              SizedBox(height: 10,),
              Text(customerID, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),),
            ],
          ),
        ),
    );
  }
}