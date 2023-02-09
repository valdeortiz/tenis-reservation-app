// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancha.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CanchaAdapter extends TypeAdapter<Cancha> {
  @override
  final int typeId = 1;

  @override
  Cancha read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cancha(
      titulo: fields[0] as String,
      dimensiones: fields[1] as String,
      imagen: fields[2] as String,
      nombre: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cancha obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.titulo)
      ..writeByte(1)
      ..write(obj.dimensiones)
      ..writeByte(2)
      ..write(obj.imagen)
      ..writeByte(3)
      ..write(obj.nombre);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CanchaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
