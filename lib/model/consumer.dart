import 'package:hive/hive.dart';
part 'consumer.g.dart';

@HiveType(typeId: 0)
class Consumer extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String street;
  @HiveField(2)
  String number;
  @HiveField(3)
  String postalCode;
  @HiveField(4)
  String town;
  @HiveField(5)
  String customerID;

  Consumer({this.name,this.street,this.number,
            this.postalCode,this.town,this.customerID});

}