import 'package:todo_poc/db/my_database.dart';
import 'package:todo_poc/db/podo/ref_with_product.dart';


class ListWithData {
  final InfosGenerale infosGenerale;
  final FormatImage formatImage;
  final List<RefWithProduct> references;

  ListWithData(this.infosGenerale, this.formatImage, this.references);
}