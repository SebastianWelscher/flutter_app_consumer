import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:flutter_app_consumer/model/consumer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_app_consumer/dialogs/consumerInputDialog.dart';
import 'package:flutter_app_consumer/widget/listCard.dart';
import 'package:flutter_app_consumer/pages/detailsPage.dart';

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

  _deleteItem(var index){
    Box<Consumer> consumerBox = Hive.box('consumer');
    consumerBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,style: GoogleFonts.montserrat(
          fontSize: 25,
          color: Colors.blueAccent,
        ),),
        backgroundColor: Color(0xfffff8f7),
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
                          child: Text('Kontakt Box is leer',
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: box.values.length,
                          itemBuilder: (context, index) {
                            Consumer consumer = box.getAt(index);
                            return Dismissible(
                              key: Key(consumer.name),
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
                                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(name: consumer.name, address: consumer.address))),
                                  child: ListCard(
                                    name: consumer.name,
                                    address: consumer.address,
                                  ),
                                ),
                              )
                            );
                          }
                      );
                    }
    ),
          ),
    ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _inputDialog,
      ),
    );
  }
}