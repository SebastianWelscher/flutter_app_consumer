import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_app_consumer/model/consumer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_app_consumer/dialogs/consumerInputDialog.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
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
                        return ListTile(
                          title: Text(consumer.name),
                          subtitle: Column(
                            children: [
                              Text(consumer.customerID),
                              Text(consumer.address),
                            ],
                          ),
                        );
                      }
                  );
                }
    ),
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _inputDialog,
      ),
    );
  }
}
