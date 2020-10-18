// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConsumerAdapter extends TypeAdapter<Consumer> {
  @override
  final int typeId = 0;

  @override
  Consumer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Consumer(
      name: fields[0] as String,
      street: fields[1] as String,
      number: fields[2] as String,
      postalCode: fields[3] as String,
      town: fields[4] as String,
      customerID: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Consumer obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.street)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.postalCode)
      ..writeByte(4)
      ..write(obj.town)
      ..writeByte(5)
      ..write(obj.customerID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsumerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
