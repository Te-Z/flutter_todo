import 'package:todo_poc/db/my_database.dart';
import 'package:todo_poc/db/podo/produit_with_tarif.dart';

class RefWithProduct {
  final Reference reference;
  final List<ProductWithData> produits;

  RefWithProduct(this.reference, this.produits);
}