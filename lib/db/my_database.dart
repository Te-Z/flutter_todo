import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/tables/format_image_table.dart';
import 'package:todo_poc/db/tables/liste_produits_table.dart';
import 'package:todo_poc/db/tables/produits_table.dart';
import 'package:todo_poc/db/tables/tarif_table.dart';
import 'package:todo_poc/db/tables/todos_table.dart';

part 'my_database.g.dart';

@UseMoor(tables: [Todos, ListProduits, Tarifs, Produits, FormatImages], daos: [TodosDao])
class MyDatabase extends _$MyDatabase{
  MyDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Todos, ListProduits, Tarifs, Produits, FormatImages])
class TodosDao extends DatabaseAccessor<MyDatabase> with _$TodosDaoMixin {
  TodosDao(MyDatabase db) : super(db);

  Future<List<Todo>> get allTodos => select(todos).get();

  Stream<List<Todo>> get watchAllTodos => select(todos).watch();

  /// Retourne l'id généré
  ///
  /// Pour ajouter une
  /// addTodoEntry(
  ///  TodosCompanion(
  ///    title: Value('Important task'),
  ///    content: Value('Refactor persistence code'),
  ///  ),
  /// );
  ///
  /// Future<void> insertMultipleEntries() async{
  ///  await batch((batch) {
  ///    // functions in a batch don't have to be awaited - just
  ///    // await the whole batch afterwards.
  ///    batch.insertAll(todos, [
  ///      TodosCompanion.insert(
  ///        title: 'First entry',
  ///        content: 'My content',
  ///      ),
  ///      TodosCompanion.insert(
  ///        title: 'Another entry',
  ///        content: 'More content',
  ///      ),
  ///      // ...
  ///    ]);
  ///  });
  /// }
  ///
  Future<int> addTodoEntry(Todo entry) => into(todos).insert(entry);

  /// Utiliser replace va mettre à jour tous les champs qui ne sont pas marqués comme primary key.
  /// Il va aussi s'assurer que seul l'objet ayant la meme primary key sera mis à jour.
  Future updateTodoEntry(Todo entry) => update(todos).replace(entry);

  /// Supprime une t odo
  Future deleteTodo(Todo entry) => delete(todos).delete(entry);
}