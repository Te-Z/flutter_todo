import 'package:moor_flutter/moor_flutter.dart';

class AutreColoris extends Table {

  TextColumn get ref => text().named('ref')();
  TextColumn get product => text().named('product').nullable().customConstraint('NULL REFERENCES produits(id)')();

  @override
  Set<Column> get primaryKey => {ref};
}