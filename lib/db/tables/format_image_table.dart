import 'package:moor_flutter/moor_flutter.dart';

class FormatImages extends Table {

  IntColumn get listId => integer().named('list_id')();
  TextColumn get pp => text().named('pp')();
  TextColumn get vc => text().named('vc')();

  @override
  List<String> get customConstraints => ['FOREIGN KEY (list_id) REFERENCES listProduits(id)'];
}