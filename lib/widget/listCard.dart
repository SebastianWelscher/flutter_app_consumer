import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCard extends StatelessWidget {

  String name;
  String address;

  ListCard({@required this.name,@required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: GoogleFonts.montserrat(
                color: Color(0xaa2b2b2b),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Text(address,style: GoogleFonts.comfortaa(
                fontSize: 14,

              ),),
            ],
          ),
        ),
      ),
    );
  }
}
