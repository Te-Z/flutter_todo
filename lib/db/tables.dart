import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

class Todos extends Table {

  BoolColumn get isComplete => boolean().named('isComplete')();
  TextColumn get id => text().named('id').customConstraint('UNIQUE')();
  TextColumn get note => text().named('note')();
  TextColumn get task => text().named('task')();

  @override
  Set<Column> get primaryKey => {id};
}