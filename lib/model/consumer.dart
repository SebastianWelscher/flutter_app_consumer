import 'package:hive/hive.dart';
part 'consumer.g.dart';

@HiveType(typeId: 0)
class Consumer extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String address;
  @HiveField(2)
  String customerID;

  Consumer({this.name,this.address,this.customerID});

}