import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:flutter_app_consumer/model/consumer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_app_consumer/dialogs/consumerInputDialog.dart';
import 'package:flutter_app_consumer/pages/detailsPage.dart';
import 'settingsPage.dart';

class Homepage extends StatefulWidget {

  String title;

  Homepage({this.title});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  _inputDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context) => ConsumerInputDialog(context: context,),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    Hive.box('consumer').compact();
    Hive.close();
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hive',style: GoogleFonts.salsa(
          fontSize: 25,
          color: Colors.blueAccent,
        ),),
        backgroundColor: Color(0xfffff8f7),
        actions: [
          IconButton(
              icon: Icon(Icons.settings,color: Colors.blueAccent,),
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> SettingsPage()))),
        ],
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ValueListenableBuilder(
                    valueListenable: Hive.box<Consumer>('consumer').listenable(),
                    builder: (BuildContext context, Box<Consumer> box, _) {
                      if (box.values.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Kontaktbox ist leer',
                              style: GoogleFonts.comfortaa(
                                color: Color(0xfffff8f7),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),),
                              SizedBox(height: 70,),
                              Image.asset('assets/emptySylvester.gif',height: 300,width: 400,),
                            ],
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: box.values.length,
                          itemBuilder: (context, index) {
                            Consumer consumer = box.getAt(index);
                            print(consumer.name);
                            print(consumer.street);
                            print(consumer.number);
                            print(consumer.postalCode);
                            print(consumer.town);
                            print(consumer.customerID);
                            return Dismissible(
                              key: Key(consumer.customerID),
                              direction: DismissDirection.endToStart,
                              background: Container(color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_back_ios_outlined,
                                  color: Colors.white,),
                                  Text('nach links zum löschen',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),),
                                  SizedBox(width: 10,),
                                ],
                              ),),
                              onDismissed: (direction){
                                box.deleteAt(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left:4.0,right: 4.0,top: 1.0,bottom: 1.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(
                                    name: consumer.name,
                                    street: consumer.street,
                                    number: consumer.number,
                                    postalCode: consumer.postalCode,
                                    town: consumer.town,
                                    customerID: consumer.customerID,
                                  ))),
                                  child:Container(
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
                                                Text(consumer.name, style: GoogleFonts.montserrat(
                                                  color: Color(0xaa2b2b2b),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                                SizedBox(height: 10,),
                                                Text(consumer.street + consumer.number,style: GoogleFonts.comfortaa(
                                                  color: Color(0xcc2b2b2b),
                                                  fontSize: 14,
                                                ),),
                                                SizedBox(height: 2,),
                                                Text(consumer.postalCode + consumer.town,style: GoogleFonts.comfortaa(
                                                  color: Color(0xcc2b2b2b),
                                                  fontSize: 14,
                                                ),),
                                              ],
                                            ),
                                            Spacer(),
                                            Icon(Icons.arrow_back,
                                              color: Color(0xcc2b2b2b),),
                                            Icon(Icons.delete,
                                              color: Color(0xcc2b2b2b),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  )
                                ),
                              );
                          }
                      );
                    }
    ),
          ),
    ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add,color: Colors.blueAccent,),
        backgroundColor: Color(0xfffff8f7),
        label: Text('Kontakt hinzufügen',
        style: TextStyle(color: Colors.blueAccent),),
        onPressed: _inputDialog,
      ),
    );
  }
}