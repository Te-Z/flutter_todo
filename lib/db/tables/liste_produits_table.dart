import 'package:moor/moor.dart';

class ListProduits extends Table {

  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get devise => text().named("devise")();
  TextColumn get masque => text().named("masque")();
  IntColumn get nbDecimales => integer().named("nbDecimales")();
  TextColumn get nouvelleCollection => text().named("nouvelleCollection")();
  TextColumn get pathImage => text().named("pathImage")();

  @override
  Set<Column> get primaryKey => {id};
}