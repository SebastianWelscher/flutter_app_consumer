import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {

  final Uri _emailTo = Uri(
    scheme: 'mailto',
    path: 'SebastianWelscher@mailbox.org',
    queryParameters: {
      'subject': 'Example Subject & Symbols are allowed',
    }
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Einstellungen',
        style: GoogleFonts.varela(
          fontSize: 20,
        ),),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('E-Mail senden'),
                onTap: ()=> launch(_emailTo.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
