import 'package:moor_flutter/moor_flutter.dart';

class Tarifs extends Table {

  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get produitId => text().named('produit_id')();
  TextColumn get dateDebut => text().named("date_debut")();
  IntColumn get decote => integer().named('decote')();
  RealColumn get prix => real().named('prix')();
  RealColumn get prixBarre => real().named('prix_barre')();
  IntColumn get typeCom => integer().named('typeCom')();
  TextColumn get typePrix => text().named("typePrix")();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => ['FOREIGN KEY (produitId) REFERENCES produit(produit_id)'];
}