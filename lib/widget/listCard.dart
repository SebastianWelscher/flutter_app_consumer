import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCard extends StatelessWidget {

  String name;
  String street;
  String number;
  String postalCode;
  String town;
  String customerID;

  ListCard({String name,String street,String number, String postalCode, String town}){

       this.name = name;
       this.street = street;
       this.number = number;
       this.postalCode = postalCode;
       this.street = street;

  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: GoogleFonts.montserrat(
                    color: Color(0xaa2b2b2b),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 10,),
                  Text(street,style: GoogleFonts.comfortaa(
                    fontSize: 14,
                  ),),
                  Text(postalCode,style: GoogleFonts.comfortaa(
                    fontSize: 14,
                  ),),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_back),
              Icon(Icons.delete),
            ],
          ),
        ),
      ),
    );
  }
}