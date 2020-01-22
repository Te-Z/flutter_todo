import 'package:todo_poc/db/my_database.dart';

class ProductWithData {
  final Produit produit;
  final List<AutreColori> autresColoris;
  final Tarif tarif;

  ProductWithData(this.produit, this.autresColoris, this.tarif);
}