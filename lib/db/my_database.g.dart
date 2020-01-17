// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todo extends DataClass implements Insertable<Todo> {
  final bool isComplete;
  final int id;
  final String note;
  final String task;
  Todo(
      {@required this.isComplete,
      @required this.id,
      @required this.note,
      @required this.task});
  factory Todo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final boolType = db.typeSystem.forDartType<bool>();
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Todo(
      isComplete: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isComplete']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      task: stringType.mapFromDatabaseResponse(data['${effectivePrefix}task']),
    );
  }
  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Todo(
      isComplete: serializer.fromJson<bool>(json['isComplete']),
      id: serializer.fromJson<int>(json['id']),
      note: serializer.fromJson<String>(json['note']),
      task: serializer.fromJson<String>(json['task']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'isComplete': serializer.toJson<bool>(isComplete),
      'id': serializer.toJson<int>(id),
      'note': serializer.toJson<String>(note),
      'task': serializer.toJson<String>(task),
    };
  }

  @override
  TodosCompanion createCompanion(bool nullToAbsent) {
    return TodosCompanion(
      isComplete: isComplete == null && nullToAbsent
          ? const Value.absent()
          : Value(isComplete),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      task: task == null && nullToAbsent ? const Value.absent() : Value(task),
    );
  }

  Todo copyWith({bool isComplete, int id, String note, String task}) => Todo(
        isComplete: isComplete ?? this.isComplete,
        id: id ?? this.id,
        note: note ?? this.note,
        task: task ?? this.task,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('isComplete: $isComplete, ')
          ..write('id: $id, ')
          ..write('note: $note, ')
          ..write('task: $task')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(isComplete.hashCode,
      $mrjc(id.hashCode, $mrjc(note.hashCode, task.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Todo &&
          other.isComplete == this.isComplete &&
          other.id == this.id &&
          other.note == this.note &&
          other.task == this.task);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<bool> isComplete;
  final Value<int> id;
  final Value<String> note;
  final Value<String> task;
  const TodosCompanion({
    this.isComplete = const Value.absent(),
    this.id = const Value.absent(),
    this.note = const Value.absent(),
    this.task = const Value.absent(),
  });
  TodosCompanion.insert({
    @required bool isComplete,
    this.id = const Value.absent(),
    @required String note,
    @required String task,
  })  : isComplete = Value(isComplete),
        note = Value(note),
        task = Value(task);
  TodosCompanion copyWith(
      {Value<bool> isComplete,
      Value<int> id,
      Value<String> note,
      Value<String> task}) {
    return TodosCompanion(
      isComplete: isComplete ?? this.isComplete,
      id: id ?? this.id,
      note: note ?? this.note,
      task: task ?? this.task,
    );
  }
}

class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  final GeneratedDatabase _db;
  final String _alias;
  $TodosTable(this._db, [this._alias]);
  final VerificationMeta _isCompleteMeta = const VerificationMeta('isComplete');
  GeneratedBoolColumn _isComplete;
  @override
  GeneratedBoolColumn get isComplete => _isComplete ??= _constructIsComplete();
  GeneratedBoolColumn _constructIsComplete() {
    return GeneratedBoolColumn(
      'isComplete',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      false,
    );
  }

  final VerificationMeta _taskMeta = const VerificationMeta('task');
  GeneratedTextColumn _task;
  @override
  GeneratedTextColumn get task => _task ??= _constructTask();
  GeneratedTextColumn _constructTask() {
    return GeneratedTextColumn(
      'task',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [isComplete, id, note, task];
  @override
  $TodosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todos';
  @override
  final String actualTableName = 'todos';
  @override
  VerificationContext validateIntegrity(TodosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.isComplete.present) {
      context.handle(_isCompleteMeta,
          isComplete.isAcceptableValue(d.isComplete.value, _isCompleteMeta));
    } else if (isComplete.isRequired && isInserting) {
      context.missing(_isCompleteMeta);
    }
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.note.present) {
      context.handle(
          _noteMeta, note.isAcceptableValue(d.note.value, _noteMeta));
    } else if (note.isRequired && isInserting) {
      context.missing(_noteMeta);
    }
    if (d.task.present) {
      context.handle(
          _taskMeta, task.isAcceptableValue(d.task.value, _taskMeta));
    } else if (task.isRequired && isInserting) {
      context.missing(_taskMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Todo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TodosCompanion d) {
    final map = <String, Variable>{};
    if (d.isComplete.present) {
      map['isComplete'] = Variable<bool, BoolType>(d.isComplete.value);
    }
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.note.present) {
      map['note'] = Variable<String, StringType>(d.note.value);
    }
    if (d.task.present) {
      map['task'] = Variable<String, StringType>(d.task.value);
    }
    return map;
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TodosTable _todos;
  $TodosTable get todos => _todos ??= $TodosTable(this);
  TodosDao _todosDao;
  TodosDao get todosDao => _todosDao ??= TodosDao(this as MyDatabase);
  @override
  List<TableInfo> get allTables => [todos];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TodosDaoMixin on DatabaseAccessor<MyDatabase> {
  $TodosTable get todos => db.todos;
}
