import 'package:moor_flutter/moor_flutter.dart';

class Produits extends Table {

  TextColumn get id => text().named('id')();
  IntColumn get listId => integer().named('list_id')();
  TextColumn get coloris => text().named("coloris")();
  TextColumn get dateImplant => text().named("dateImplant")();
  TextColumn get familleWeb => text().named("familleWeb")();
  TextColumn get idImage => text().named("idImage")();
  TextColumn get libelle => text().named("libelle")();
  RealColumn get noteMoyenne => real().named("noteMoyenne")();
  BoolColumn get nouveaute => boolean().named("nouveaute")();
  TextColumn get url => text().named("url")();

  @override
  Set<Column> get primaryKey => {id};
}