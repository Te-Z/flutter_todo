import 'package:moor_flutter/moor_flutter.dart';

class AutreColoris extends Table {

  TextColumn get ref => text().named('ref')();
  TextColumn get original => text().named('original')();

  @override
  Set<Column> get primaryKey => {ref};

  @override
  List<String> get customConstraints =>  ['FOREIGN KEY (original) REFERENCES produits(id)'];
}