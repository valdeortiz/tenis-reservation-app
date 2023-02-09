// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservacion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReservacionAdapter extends TypeAdapter<Reservacion> {
  @override
  final int typeId = 0;

  @override
  Reservacion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Reservacion(
      id: fields[0] as int,
      fecha: fields[1] as DateTime,
      nombreUsuario: fields[2] as String,
      porcentajeLluvia: fields[3] as double,
      cancha: fields[4] as Cancha,
    );
  }

  @override
  void write(BinaryWriter writer, Reservacion obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fecha)
      ..writeByte(2)
      ..write(obj.nombreUsuario)
      ..writeByte(3)
      ..write(obj.porcentajeLluvia)
      ..writeByte(4)
      ..write(obj.cancha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservacionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
