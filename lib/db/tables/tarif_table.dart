import 'package:moor_flutter/moor_flutter.dart';

class Tarifs extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get dateDebut => text()();
  IntColumn get decote => integer()();
  RealColumn get prix => real()();
  RealColumn get prixBarre => real()();
  IntColumn get typeCom => integer()();
  TextColumn get typePrix => text()();

  @override
  Set<Column> get primaryKey => {id};
}