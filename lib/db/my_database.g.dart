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

class ListProduit extends DataClass implements Insertable<ListProduit> {
  final int id;
  final String devise;
  final String masque;
  final int nbDecimales;
  final String nouvelleCollection;
  final String pathImage;
  ListProduit(
      {@required this.id,
      @required this.devise,
      @required this.masque,
      @required this.nbDecimales,
      @required this.nouvelleCollection,
      @required this.pathImage});
  factory ListProduit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ListProduit(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      devise:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}devise']),
      masque:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}masque']),
      nbDecimales: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}nbDecimales']),
      nouvelleCollection: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}nouvelleCollection']),
      pathImage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pathImage']),
    );
  }
  factory ListProduit.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return ListProduit(
      id: serializer.fromJson<int>(json['id']),
      devise: serializer.fromJson<String>(json['devise']),
      masque: serializer.fromJson<String>(json['masque']),
      nbDecimales: serializer.fromJson<int>(json['nbDecimales']),
      nouvelleCollection:
          serializer.fromJson<String>(json['nouvelleCollection']),
      pathImage: serializer.fromJson<String>(json['pathImage']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'devise': serializer.toJson<String>(devise),
      'masque': serializer.toJson<String>(masque),
      'nbDecimales': serializer.toJson<int>(nbDecimales),
      'nouvelleCollection': serializer.toJson<String>(nouvelleCollection),
      'pathImage': serializer.toJson<String>(pathImage),
    };
  }

  @override
  ListProduitsCompanion createCompanion(bool nullToAbsent) {
    return ListProduitsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      devise:
          devise == null && nullToAbsent ? const Value.absent() : Value(devise),
      masque:
          masque == null && nullToAbsent ? const Value.absent() : Value(masque),
      nbDecimales: nbDecimales == null && nullToAbsent
          ? const Value.absent()
          : Value(nbDecimales),
      nouvelleCollection: nouvelleCollection == null && nullToAbsent
          ? const Value.absent()
          : Value(nouvelleCollection),
      pathImage: pathImage == null && nullToAbsent
          ? const Value.absent()
          : Value(pathImage),
    );
  }

  ListProduit copyWith(
          {int id,
          String devise,
          String masque,
          int nbDecimales,
          String nouvelleCollection,
          String pathImage}) =>
      ListProduit(
        id: id ?? this.id,
        devise: devise ?? this.devise,
        masque: masque ?? this.masque,
        nbDecimales: nbDecimales ?? this.nbDecimales,
        nouvelleCollection: nouvelleCollection ?? this.nouvelleCollection,
        pathImage: pathImage ?? this.pathImage,
      );
  @override
  String toString() {
    return (StringBuffer('ListProduit(')
          ..write('id: $id, ')
          ..write('devise: $devise, ')
          ..write('masque: $masque, ')
          ..write('nbDecimales: $nbDecimales, ')
          ..write('nouvelleCollection: $nouvelleCollection, ')
          ..write('pathImage: $pathImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          devise.hashCode,
          $mrjc(
              masque.hashCode,
              $mrjc(nbDecimales.hashCode,
                  $mrjc(nouvelleCollection.hashCode, pathImage.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ListProduit &&
          other.id == this.id &&
          other.devise == this.devise &&
          other.masque == this.masque &&
          other.nbDecimales == this.nbDecimales &&
          other.nouvelleCollection == this.nouvelleCollection &&
          other.pathImage == this.pathImage);
}

class ListProduitsCompanion extends UpdateCompanion<ListProduit> {
  final Value<int> id;
  final Value<String> devise;
  final Value<String> masque;
  final Value<int> nbDecimales;
  final Value<String> nouvelleCollection;
  final Value<String> pathImage;
  const ListProduitsCompanion({
    this.id = const Value.absent(),
    this.devise = const Value.absent(),
    this.masque = const Value.absent(),
    this.nbDecimales = const Value.absent(),
    this.nouvelleCollection = const Value.absent(),
    this.pathImage = const Value.absent(),
  });
  ListProduitsCompanion.insert({
    this.id = const Value.absent(),
    @required String devise,
    @required String masque,
    @required int nbDecimales,
    @required String nouvelleCollection,
    @required String pathImage,
  })  : devise = Value(devise),
        masque = Value(masque),
        nbDecimales = Value(nbDecimales),
        nouvelleCollection = Value(nouvelleCollection),
        pathImage = Value(pathImage);
  ListProduitsCompanion copyWith(
      {Value<int> id,
      Value<String> devise,
      Value<String> masque,
      Value<int> nbDecimales,
      Value<String> nouvelleCollection,
      Value<String> pathImage}) {
    return ListProduitsCompanion(
      id: id ?? this.id,
      devise: devise ?? this.devise,
      masque: masque ?? this.masque,
      nbDecimales: nbDecimales ?? this.nbDecimales,
      nouvelleCollection: nouvelleCollection ?? this.nouvelleCollection,
      pathImage: pathImage ?? this.pathImage,
    );
  }
}

class $ListProduitsTable extends ListProduits
    with TableInfo<$ListProduitsTable, ListProduit> {
  final GeneratedDatabase _db;
  final String _alias;
  $ListProduitsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _deviseMeta = const VerificationMeta('devise');
  GeneratedTextColumn _devise;
  @override
  GeneratedTextColumn get devise => _devise ??= _constructDevise();
  GeneratedTextColumn _constructDevise() {
    return GeneratedTextColumn(
      'devise',
      $tableName,
      false,
    );
  }

  final VerificationMeta _masqueMeta = const VerificationMeta('masque');
  GeneratedTextColumn _masque;
  @override
  GeneratedTextColumn get masque => _masque ??= _constructMasque();
  GeneratedTextColumn _constructMasque() {
    return GeneratedTextColumn(
      'masque',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nbDecimalesMeta =
      const VerificationMeta('nbDecimales');
  GeneratedIntColumn _nbDecimales;
  @override
  GeneratedIntColumn get nbDecimales =>
      _nbDecimales ??= _constructNbDecimales();
  GeneratedIntColumn _constructNbDecimales() {
    return GeneratedIntColumn(
      'nbDecimales',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nouvelleCollectionMeta =
      const VerificationMeta('nouvelleCollection');
  GeneratedTextColumn _nouvelleCollection;
  @override
  GeneratedTextColumn get nouvelleCollection =>
      _nouvelleCollection ??= _constructNouvelleCollection();
  GeneratedTextColumn _constructNouvelleCollection() {
    return GeneratedTextColumn(
      'nouvelleCollection',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pathImageMeta = const VerificationMeta('pathImage');
  GeneratedTextColumn _pathImage;
  @override
  GeneratedTextColumn get pathImage => _pathImage ??= _constructPathImage();
  GeneratedTextColumn _constructPathImage() {
    return GeneratedTextColumn(
      'pathImage',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, devise, masque, nbDecimales, nouvelleCollection, pathImage];
  @override
  $ListProduitsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'list_produits';
  @override
  final String actualTableName = 'list_produits';
  @override
  VerificationContext validateIntegrity(ListProduitsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.devise.present) {
      context.handle(
          _deviseMeta, devise.isAcceptableValue(d.devise.value, _deviseMeta));
    } else if (devise.isRequired && isInserting) {
      context.missing(_deviseMeta);
    }
    if (d.masque.present) {
      context.handle(
          _masqueMeta, masque.isAcceptableValue(d.masque.value, _masqueMeta));
    } else if (masque.isRequired && isInserting) {
      context.missing(_masqueMeta);
    }
    if (d.nbDecimales.present) {
      context.handle(_nbDecimalesMeta,
          nbDecimales.isAcceptableValue(d.nbDecimales.value, _nbDecimalesMeta));
    } else if (nbDecimales.isRequired && isInserting) {
      context.missing(_nbDecimalesMeta);
    }
    if (d.nouvelleCollection.present) {
      context.handle(
          _nouvelleCollectionMeta,
          nouvelleCollection.isAcceptableValue(
              d.nouvelleCollection.value, _nouvelleCollectionMeta));
    } else if (nouvelleCollection.isRequired && isInserting) {
      context.missing(_nouvelleCollectionMeta);
    }
    if (d.pathImage.present) {
      context.handle(_pathImageMeta,
          pathImage.isAcceptableValue(d.pathImage.value, _pathImageMeta));
    } else if (pathImage.isRequired && isInserting) {
      context.missing(_pathImageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ListProduit map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ListProduit.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ListProduitsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.devise.present) {
      map['devise'] = Variable<String, StringType>(d.devise.value);
    }
    if (d.masque.present) {
      map['masque'] = Variable<String, StringType>(d.masque.value);
    }
    if (d.nbDecimales.present) {
      map['nbDecimales'] = Variable<int, IntType>(d.nbDecimales.value);
    }
    if (d.nouvelleCollection.present) {
      map['nouvelleCollection'] =
          Variable<String, StringType>(d.nouvelleCollection.value);
    }
    if (d.pathImage.present) {
      map['pathImage'] = Variable<String, StringType>(d.pathImage.value);
    }
    return map;
  }

  @override
  $ListProduitsTable createAlias(String alias) {
    return $ListProduitsTable(_db, alias);
  }
}

class Tarif extends DataClass implements Insertable<Tarif> {
  final int id;
  final String produitId;
  final String dateDebut;
  final int decote;
  final double prix;
  final double prixBarre;
  final int typeCom;
  final String typePrix;
  Tarif(
      {@required this.id,
      @required this.produitId,
      @required this.dateDebut,
      @required this.decote,
      @required this.prix,
      @required this.prixBarre,
      @required this.typeCom,
      @required this.typePrix});
  factory Tarif.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Tarif(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      produitId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}produit_id']),
      dateDebut: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_debut']),
      decote: intType.mapFromDatabaseResponse(data['${effectivePrefix}decote']),
      prix: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}prix']),
      prixBarre: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}prix_barre']),
      typeCom:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}typeCom']),
      typePrix: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}typePrix']),
    );
  }
  factory Tarif.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Tarif(
      id: serializer.fromJson<int>(json['id']),
      produitId: serializer.fromJson<String>(json['produitId']),
      dateDebut: serializer.fromJson<String>(json['dateDebut']),
      decote: serializer.fromJson<int>(json['decote']),
      prix: serializer.fromJson<double>(json['prix']),
      prixBarre: serializer.fromJson<double>(json['prixBarre']),
      typeCom: serializer.fromJson<int>(json['typeCom']),
      typePrix: serializer.fromJson<String>(json['typePrix']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'produitId': serializer.toJson<String>(produitId),
      'dateDebut': serializer.toJson<String>(dateDebut),
      'decote': serializer.toJson<int>(decote),
      'prix': serializer.toJson<double>(prix),
      'prixBarre': serializer.toJson<double>(prixBarre),
      'typeCom': serializer.toJson<int>(typeCom),
      'typePrix': serializer.toJson<String>(typePrix),
    };
  }

  @override
  TarifsCompanion createCompanion(bool nullToAbsent) {
    return TarifsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      produitId: produitId == null && nullToAbsent
          ? const Value.absent()
          : Value(produitId),
      dateDebut: dateDebut == null && nullToAbsent
          ? const Value.absent()
          : Value(dateDebut),
      decote:
          decote == null && nullToAbsent ? const Value.absent() : Value(decote),
      prix: prix == null && nullToAbsent ? const Value.absent() : Value(prix),
      prixBarre: prixBarre == null && nullToAbsent
          ? const Value.absent()
          : Value(prixBarre),
      typeCom: typeCom == null && nullToAbsent
          ? const Value.absent()
          : Value(typeCom),
      typePrix: typePrix == null && nullToAbsent
          ? const Value.absent()
          : Value(typePrix),
    );
  }

  Tarif copyWith(
          {int id,
          String produitId,
          String dateDebut,
          int decote,
          double prix,
          double prixBarre,
          int typeCom,
          String typePrix}) =>
      Tarif(
        id: id ?? this.id,
        produitId: produitId ?? this.produitId,
        dateDebut: dateDebut ?? this.dateDebut,
        decote: decote ?? this.decote,
        prix: prix ?? this.prix,
        prixBarre: prixBarre ?? this.prixBarre,
        typeCom: typeCom ?? this.typeCom,
        typePrix: typePrix ?? this.typePrix,
      );
  @override
  String toString() {
    return (StringBuffer('Tarif(')
          ..write('id: $id, ')
          ..write('produitId: $produitId, ')
          ..write('dateDebut: $dateDebut, ')
          ..write('decote: $decote, ')
          ..write('prix: $prix, ')
          ..write('prixBarre: $prixBarre, ')
          ..write('typeCom: $typeCom, ')
          ..write('typePrix: $typePrix')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          produitId.hashCode,
          $mrjc(
              dateDebut.hashCode,
              $mrjc(
                  decote.hashCode,
                  $mrjc(
                      prix.hashCode,
                      $mrjc(prixBarre.hashCode,
                          $mrjc(typeCom.hashCode, typePrix.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Tarif &&
          other.id == this.id &&
          other.produitId == this.produitId &&
          other.dateDebut == this.dateDebut &&
          other.decote == this.decote &&
          other.prix == this.prix &&
          other.prixBarre == this.prixBarre &&
          other.typeCom == this.typeCom &&
          other.typePrix == this.typePrix);
}

class TarifsCompanion extends UpdateCompanion<Tarif> {
  final Value<int> id;
  final Value<String> produitId;
  final Value<String> dateDebut;
  final Value<int> decote;
  final Value<double> prix;
  final Value<double> prixBarre;
  final Value<int> typeCom;
  final Value<String> typePrix;
  const TarifsCompanion({
    this.id = const Value.absent(),
    this.produitId = const Value.absent(),
    this.dateDebut = const Value.absent(),
    this.decote = const Value.absent(),
    this.prix = const Value.absent(),
    this.prixBarre = const Value.absent(),
    this.typeCom = const Value.absent(),
    this.typePrix = const Value.absent(),
  });
  TarifsCompanion.insert({
    this.id = const Value.absent(),
    @required String produitId,
    @required String dateDebut,
    @required int decote,
    @required double prix,
    @required double prixBarre,
    @required int typeCom,
    @required String typePrix,
  })  : produitId = Value(produitId),
        dateDebut = Value(dateDebut),
        decote = Value(decote),
        prix = Value(prix),
        prixBarre = Value(prixBarre),
        typeCom = Value(typeCom),
        typePrix = Value(typePrix);
  TarifsCompanion copyWith(
      {Value<int> id,
      Value<String> produitId,
      Value<String> dateDebut,
      Value<int> decote,
      Value<double> prix,
      Value<double> prixBarre,
      Value<int> typeCom,
      Value<String> typePrix}) {
    return TarifsCompanion(
      id: id ?? this.id,
      produitId: produitId ?? this.produitId,
      dateDebut: dateDebut ?? this.dateDebut,
      decote: decote ?? this.decote,
      prix: prix ?? this.prix,
      prixBarre: prixBarre ?? this.prixBarre,
      typeCom: typeCom ?? this.typeCom,
      typePrix: typePrix ?? this.typePrix,
    );
  }
}

class $TarifsTable extends Tarifs with TableInfo<$TarifsTable, Tarif> {
  final GeneratedDatabase _db;
  final String _alias;
  $TarifsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _produitIdMeta = const VerificationMeta('produitId');
  GeneratedTextColumn _produitId;
  @override
  GeneratedTextColumn get produitId => _produitId ??= _constructProduitId();
  GeneratedTextColumn _constructProduitId() {
    return GeneratedTextColumn(
      'produit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateDebutMeta = const VerificationMeta('dateDebut');
  GeneratedTextColumn _dateDebut;
  @override
  GeneratedTextColumn get dateDebut => _dateDebut ??= _constructDateDebut();
  GeneratedTextColumn _constructDateDebut() {
    return GeneratedTextColumn(
      'date_debut',
      $tableName,
      false,
    );
  }

  final VerificationMeta _decoteMeta = const VerificationMeta('decote');
  GeneratedIntColumn _decote;
  @override
  GeneratedIntColumn get decote => _decote ??= _constructDecote();
  GeneratedIntColumn _constructDecote() {
    return GeneratedIntColumn(
      'decote',
      $tableName,
      false,
    );
  }

  final VerificationMeta _prixMeta = const VerificationMeta('prix');
  GeneratedRealColumn _prix;
  @override
  GeneratedRealColumn get prix => _prix ??= _constructPrix();
  GeneratedRealColumn _constructPrix() {
    return GeneratedRealColumn(
      'prix',
      $tableName,
      false,
    );
  }

  final VerificationMeta _prixBarreMeta = const VerificationMeta('prixBarre');
  GeneratedRealColumn _prixBarre;
  @override
  GeneratedRealColumn get prixBarre => _prixBarre ??= _constructPrixBarre();
  GeneratedRealColumn _constructPrixBarre() {
    return GeneratedRealColumn(
      'prix_barre',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeComMeta = const VerificationMeta('typeCom');
  GeneratedIntColumn _typeCom;
  @override
  GeneratedIntColumn get typeCom => _typeCom ??= _constructTypeCom();
  GeneratedIntColumn _constructTypeCom() {
    return GeneratedIntColumn(
      'typeCom',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typePrixMeta = const VerificationMeta('typePrix');
  GeneratedTextColumn _typePrix;
  @override
  GeneratedTextColumn get typePrix => _typePrix ??= _constructTypePrix();
  GeneratedTextColumn _constructTypePrix() {
    return GeneratedTextColumn(
      'typePrix',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, produitId, dateDebut, decote, prix, prixBarre, typeCom, typePrix];
  @override
  $TarifsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tarifs';
  @override
  final String actualTableName = 'tarifs';
  @override
  VerificationContext validateIntegrity(TarifsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.produitId.present) {
      context.handle(_produitIdMeta,
          produitId.isAcceptableValue(d.produitId.value, _produitIdMeta));
    } else if (produitId.isRequired && isInserting) {
      context.missing(_produitIdMeta);
    }
    if (d.dateDebut.present) {
      context.handle(_dateDebutMeta,
          dateDebut.isAcceptableValue(d.dateDebut.value, _dateDebutMeta));
    } else if (dateDebut.isRequired && isInserting) {
      context.missing(_dateDebutMeta);
    }
    if (d.decote.present) {
      context.handle(
          _decoteMeta, decote.isAcceptableValue(d.decote.value, _decoteMeta));
    } else if (decote.isRequired && isInserting) {
      context.missing(_decoteMeta);
    }
    if (d.prix.present) {
      context.handle(
          _prixMeta, prix.isAcceptableValue(d.prix.value, _prixMeta));
    } else if (prix.isRequired && isInserting) {
      context.missing(_prixMeta);
    }
    if (d.prixBarre.present) {
      context.handle(_prixBarreMeta,
          prixBarre.isAcceptableValue(d.prixBarre.value, _prixBarreMeta));
    } else if (prixBarre.isRequired && isInserting) {
      context.missing(_prixBarreMeta);
    }
    if (d.typeCom.present) {
      context.handle(_typeComMeta,
          typeCom.isAcceptableValue(d.typeCom.value, _typeComMeta));
    } else if (typeCom.isRequired && isInserting) {
      context.missing(_typeComMeta);
    }
    if (d.typePrix.present) {
      context.handle(_typePrixMeta,
          typePrix.isAcceptableValue(d.typePrix.value, _typePrixMeta));
    } else if (typePrix.isRequired && isInserting) {
      context.missing(_typePrixMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tarif map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tarif.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TarifsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.produitId.present) {
      map['produit_id'] = Variable<String, StringType>(d.produitId.value);
    }
    if (d.dateDebut.present) {
      map['date_debut'] = Variable<String, StringType>(d.dateDebut.value);
    }
    if (d.decote.present) {
      map['decote'] = Variable<int, IntType>(d.decote.value);
    }
    if (d.prix.present) {
      map['prix'] = Variable<double, RealType>(d.prix.value);
    }
    if (d.prixBarre.present) {
      map['prix_barre'] = Variable<double, RealType>(d.prixBarre.value);
    }
    if (d.typeCom.present) {
      map['typeCom'] = Variable<int, IntType>(d.typeCom.value);
    }
    if (d.typePrix.present) {
      map['typePrix'] = Variable<String, StringType>(d.typePrix.value);
    }
    return map;
  }

  @override
  $TarifsTable createAlias(String alias) {
    return $TarifsTable(_db, alias);
  }
}

class Produit extends DataClass implements Insertable<Produit> {
  final String id;
  final int listId;
  final String coloris;
  final String dateImplant;
  final String familleWeb;
  final String idImage;
  final String libelle;
  final double noteMoyenne;
  final bool nouveaute;
  final String url;
  Produit(
      {@required this.id,
      @required this.listId,
      @required this.coloris,
      @required this.dateImplant,
      @required this.familleWeb,
      @required this.idImage,
      @required this.libelle,
      @required this.noteMoyenne,
      @required this.nouveaute,
      @required this.url});
  factory Produit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Produit(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      listId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}list_id']),
      coloris:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}coloris']),
      dateImplant: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dateImplant']),
      familleWeb: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}familleWeb']),
      idImage:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}idImage']),
      libelle:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}libelle']),
      noteMoyenne: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}noteMoyenne']),
      nouveaute:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}nouveaute']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
    );
  }
  factory Produit.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Produit(
      id: serializer.fromJson<String>(json['id']),
      listId: serializer.fromJson<int>(json['listId']),
      coloris: serializer.fromJson<String>(json['coloris']),
      dateImplant: serializer.fromJson<String>(json['dateImplant']),
      familleWeb: serializer.fromJson<String>(json['familleWeb']),
      idImage: serializer.fromJson<String>(json['idImage']),
      libelle: serializer.fromJson<String>(json['libelle']),
      noteMoyenne: serializer.fromJson<double>(json['noteMoyenne']),
      nouveaute: serializer.fromJson<bool>(json['nouveaute']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'listId': serializer.toJson<int>(listId),
      'coloris': serializer.toJson<String>(coloris),
      'dateImplant': serializer.toJson<String>(dateImplant),
      'familleWeb': serializer.toJson<String>(familleWeb),
      'idImage': serializer.toJson<String>(idImage),
      'libelle': serializer.toJson<String>(libelle),
      'noteMoyenne': serializer.toJson<double>(noteMoyenne),
      'nouveaute': serializer.toJson<bool>(nouveaute),
      'url': serializer.toJson<String>(url),
    };
  }

  @override
  ProduitsCompanion createCompanion(bool nullToAbsent) {
    return ProduitsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      listId:
          listId == null && nullToAbsent ? const Value.absent() : Value(listId),
      coloris: coloris == null && nullToAbsent
          ? const Value.absent()
          : Value(coloris),
      dateImplant: dateImplant == null && nullToAbsent
          ? const Value.absent()
          : Value(dateImplant),
      familleWeb: familleWeb == null && nullToAbsent
          ? const Value.absent()
          : Value(familleWeb),
      idImage: idImage == null && nullToAbsent
          ? const Value.absent()
          : Value(idImage),
      libelle: libelle == null && nullToAbsent
          ? const Value.absent()
          : Value(libelle),
      noteMoyenne: noteMoyenne == null && nullToAbsent
          ? const Value.absent()
          : Value(noteMoyenne),
      nouveaute: nouveaute == null && nullToAbsent
          ? const Value.absent()
          : Value(nouveaute),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  Produit copyWith(
          {String id,
          int listId,
          String coloris,
          String dateImplant,
          String familleWeb,
          String idImage,
          String libelle,
          double noteMoyenne,
          bool nouveaute,
          String url}) =>
      Produit(
        id: id ?? this.id,
        listId: listId ?? this.listId,
        coloris: coloris ?? this.coloris,
        dateImplant: dateImplant ?? this.dateImplant,
        familleWeb: familleWeb ?? this.familleWeb,
        idImage: idImage ?? this.idImage,
        libelle: libelle ?? this.libelle,
        noteMoyenne: noteMoyenne ?? this.noteMoyenne,
        nouveaute: nouveaute ?? this.nouveaute,
        url: url ?? this.url,
      );
  @override
  String toString() {
    return (StringBuffer('Produit(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('coloris: $coloris, ')
          ..write('dateImplant: $dateImplant, ')
          ..write('familleWeb: $familleWeb, ')
          ..write('idImage: $idImage, ')
          ..write('libelle: $libelle, ')
          ..write('noteMoyenne: $noteMoyenne, ')
          ..write('nouveaute: $nouveaute, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          listId.hashCode,
          $mrjc(
              coloris.hashCode,
              $mrjc(
                  dateImplant.hashCode,
                  $mrjc(
                      familleWeb.hashCode,
                      $mrjc(
                          idImage.hashCode,
                          $mrjc(
                              libelle.hashCode,
                              $mrjc(
                                  noteMoyenne.hashCode,
                                  $mrjc(nouveaute.hashCode,
                                      url.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Produit &&
          other.id == this.id &&
          other.listId == this.listId &&
          other.coloris == this.coloris &&
          other.dateImplant == this.dateImplant &&
          other.familleWeb == this.familleWeb &&
          other.idImage == this.idImage &&
          other.libelle == this.libelle &&
          other.noteMoyenne == this.noteMoyenne &&
          other.nouveaute == this.nouveaute &&
          other.url == this.url);
}

class ProduitsCompanion extends UpdateCompanion<Produit> {
  final Value<String> id;
  final Value<int> listId;
  final Value<String> coloris;
  final Value<String> dateImplant;
  final Value<String> familleWeb;
  final Value<String> idImage;
  final Value<String> libelle;
  final Value<double> noteMoyenne;
  final Value<bool> nouveaute;
  final Value<String> url;
  const ProduitsCompanion({
    this.id = const Value.absent(),
    this.listId = const Value.absent(),
    this.coloris = const Value.absent(),
    this.dateImplant = const Value.absent(),
    this.familleWeb = const Value.absent(),
    this.idImage = const Value.absent(),
    this.libelle = const Value.absent(),
    this.noteMoyenne = const Value.absent(),
    this.nouveaute = const Value.absent(),
    this.url = const Value.absent(),
  });
  ProduitsCompanion.insert({
    @required String id,
    @required int listId,
    @required String coloris,
    @required String dateImplant,
    @required String familleWeb,
    @required String idImage,
    @required String libelle,
    @required double noteMoyenne,
    @required bool nouveaute,
    @required String url,
  })  : id = Value(id),
        listId = Value(listId),
        coloris = Value(coloris),
        dateImplant = Value(dateImplant),
        familleWeb = Value(familleWeb),
        idImage = Value(idImage),
        libelle = Value(libelle),
        noteMoyenne = Value(noteMoyenne),
        nouveaute = Value(nouveaute),
        url = Value(url);
  ProduitsCompanion copyWith(
      {Value<String> id,
      Value<int> listId,
      Value<String> coloris,
      Value<String> dateImplant,
      Value<String> familleWeb,
      Value<String> idImage,
      Value<String> libelle,
      Value<double> noteMoyenne,
      Value<bool> nouveaute,
      Value<String> url}) {
    return ProduitsCompanion(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      coloris: coloris ?? this.coloris,
      dateImplant: dateImplant ?? this.dateImplant,
      familleWeb: familleWeb ?? this.familleWeb,
      idImage: idImage ?? this.idImage,
      libelle: libelle ?? this.libelle,
      noteMoyenne: noteMoyenne ?? this.noteMoyenne,
      nouveaute: nouveaute ?? this.nouveaute,
      url: url ?? this.url,
    );
  }
}

class $ProduitsTable extends Produits with TableInfo<$ProduitsTable, Produit> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProduitsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _listIdMeta = const VerificationMeta('listId');
  GeneratedIntColumn _listId;
  @override
  GeneratedIntColumn get listId => _listId ??= _constructListId();
  GeneratedIntColumn _constructListId() {
    return GeneratedIntColumn(
      'list_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorisMeta = const VerificationMeta('coloris');
  GeneratedTextColumn _coloris;
  @override
  GeneratedTextColumn get coloris => _coloris ??= _constructColoris();
  GeneratedTextColumn _constructColoris() {
    return GeneratedTextColumn(
      'coloris',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateImplantMeta =
      const VerificationMeta('dateImplant');
  GeneratedTextColumn _dateImplant;
  @override
  GeneratedTextColumn get dateImplant =>
      _dateImplant ??= _constructDateImplant();
  GeneratedTextColumn _constructDateImplant() {
    return GeneratedTextColumn(
      'dateImplant',
      $tableName,
      false,
    );
  }

  final VerificationMeta _familleWebMeta = const VerificationMeta('familleWeb');
  GeneratedTextColumn _familleWeb;
  @override
  GeneratedTextColumn get familleWeb => _familleWeb ??= _constructFamilleWeb();
  GeneratedTextColumn _constructFamilleWeb() {
    return GeneratedTextColumn(
      'familleWeb',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idImageMeta = const VerificationMeta('idImage');
  GeneratedTextColumn _idImage;
  @override
  GeneratedTextColumn get idImage => _idImage ??= _constructIdImage();
  GeneratedTextColumn _constructIdImage() {
    return GeneratedTextColumn(
      'idImage',
      $tableName,
      false,
    );
  }

  final VerificationMeta _libelleMeta = const VerificationMeta('libelle');
  GeneratedTextColumn _libelle;
  @override
  GeneratedTextColumn get libelle => _libelle ??= _constructLibelle();
  GeneratedTextColumn _constructLibelle() {
    return GeneratedTextColumn(
      'libelle',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMoyenneMeta =
      const VerificationMeta('noteMoyenne');
  GeneratedRealColumn _noteMoyenne;
  @override
  GeneratedRealColumn get noteMoyenne =>
      _noteMoyenne ??= _constructNoteMoyenne();
  GeneratedRealColumn _constructNoteMoyenne() {
    return GeneratedRealColumn(
      'noteMoyenne',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nouveauteMeta = const VerificationMeta('nouveaute');
  GeneratedBoolColumn _nouveaute;
  @override
  GeneratedBoolColumn get nouveaute => _nouveaute ??= _constructNouveaute();
  GeneratedBoolColumn _constructNouveaute() {
    return GeneratedBoolColumn(
      'nouveaute',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        listId,
        coloris,
        dateImplant,
        familleWeb,
        idImage,
        libelle,
        noteMoyenne,
        nouveaute,
        url
      ];
  @override
  $ProduitsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'produits';
  @override
  final String actualTableName = 'produits';
  @override
  VerificationContext validateIntegrity(ProduitsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.listId.present) {
      context.handle(
          _listIdMeta, listId.isAcceptableValue(d.listId.value, _listIdMeta));
    } else if (listId.isRequired && isInserting) {
      context.missing(_listIdMeta);
    }
    if (d.coloris.present) {
      context.handle(_colorisMeta,
          coloris.isAcceptableValue(d.coloris.value, _colorisMeta));
    } else if (coloris.isRequired && isInserting) {
      context.missing(_colorisMeta);
    }
    if (d.dateImplant.present) {
      context.handle(_dateImplantMeta,
          dateImplant.isAcceptableValue(d.dateImplant.value, _dateImplantMeta));
    } else if (dateImplant.isRequired && isInserting) {
      context.missing(_dateImplantMeta);
    }
    if (d.familleWeb.present) {
      context.handle(_familleWebMeta,
          familleWeb.isAcceptableValue(d.familleWeb.value, _familleWebMeta));
    } else if (familleWeb.isRequired && isInserting) {
      context.missing(_familleWebMeta);
    }
    if (d.idImage.present) {
      context.handle(_idImageMeta,
          idImage.isAcceptableValue(d.idImage.value, _idImageMeta));
    } else if (idImage.isRequired && isInserting) {
      context.missing(_idImageMeta);
    }
    if (d.libelle.present) {
      context.handle(_libelleMeta,
          libelle.isAcceptableValue(d.libelle.value, _libelleMeta));
    } else if (libelle.isRequired && isInserting) {
      context.missing(_libelleMeta);
    }
    if (d.noteMoyenne.present) {
      context.handle(_noteMoyenneMeta,
          noteMoyenne.isAcceptableValue(d.noteMoyenne.value, _noteMoyenneMeta));
    } else if (noteMoyenne.isRequired && isInserting) {
      context.missing(_noteMoyenneMeta);
    }
    if (d.nouveaute.present) {
      context.handle(_nouveauteMeta,
          nouveaute.isAcceptableValue(d.nouveaute.value, _nouveauteMeta));
    } else if (nouveaute.isRequired && isInserting) {
      context.missing(_nouveauteMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
    } else if (url.isRequired && isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Produit map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Produit.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ProduitsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.listId.present) {
      map['list_id'] = Variable<int, IntType>(d.listId.value);
    }
    if (d.coloris.present) {
      map['coloris'] = Variable<String, StringType>(d.coloris.value);
    }
    if (d.dateImplant.present) {
      map['dateImplant'] = Variable<String, StringType>(d.dateImplant.value);
    }
    if (d.familleWeb.present) {
      map['familleWeb'] = Variable<String, StringType>(d.familleWeb.value);
    }
    if (d.idImage.present) {
      map['idImage'] = Variable<String, StringType>(d.idImage.value);
    }
    if (d.libelle.present) {
      map['libelle'] = Variable<String, StringType>(d.libelle.value);
    }
    if (d.noteMoyenne.present) {
      map['noteMoyenne'] = Variable<double, RealType>(d.noteMoyenne.value);
    }
    if (d.nouveaute.present) {
      map['nouveaute'] = Variable<bool, BoolType>(d.nouveaute.value);
    }
    if (d.url.present) {
      map['url'] = Variable<String, StringType>(d.url.value);
    }
    return map;
  }

  @override
  $ProduitsTable createAlias(String alias) {
    return $ProduitsTable(_db, alias);
  }
}

class FormatImage extends DataClass implements Insertable<FormatImage> {
  final int listId;
  final String pp;
  final String vc;
  FormatImage({@required this.listId, @required this.pp, @required this.vc});
  factory FormatImage.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return FormatImage(
      listId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}list_id']),
      pp: stringType.mapFromDatabaseResponse(data['${effectivePrefix}pp']),
      vc: stringType.mapFromDatabaseResponse(data['${effectivePrefix}vc']),
    );
  }
  factory FormatImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return FormatImage(
      listId: serializer.fromJson<int>(json['listId']),
      pp: serializer.fromJson<String>(json['pp']),
      vc: serializer.fromJson<String>(json['vc']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'listId': serializer.toJson<int>(listId),
      'pp': serializer.toJson<String>(pp),
      'vc': serializer.toJson<String>(vc),
    };
  }

  @override
  FormatImagesCompanion createCompanion(bool nullToAbsent) {
    return FormatImagesCompanion(
      listId:
          listId == null && nullToAbsent ? const Value.absent() : Value(listId),
      pp: pp == null && nullToAbsent ? const Value.absent() : Value(pp),
      vc: vc == null && nullToAbsent ? const Value.absent() : Value(vc),
    );
  }

  FormatImage copyWith({int listId, String pp, String vc}) => FormatImage(
        listId: listId ?? this.listId,
        pp: pp ?? this.pp,
        vc: vc ?? this.vc,
      );
  @override
  String toString() {
    return (StringBuffer('FormatImage(')
          ..write('listId: $listId, ')
          ..write('pp: $pp, ')
          ..write('vc: $vc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(listId.hashCode, $mrjc(pp.hashCode, vc.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FormatImage &&
          other.listId == this.listId &&
          other.pp == this.pp &&
          other.vc == this.vc);
}

class FormatImagesCompanion extends UpdateCompanion<FormatImage> {
  final Value<int> listId;
  final Value<String> pp;
  final Value<String> vc;
  const FormatImagesCompanion({
    this.listId = const Value.absent(),
    this.pp = const Value.absent(),
    this.vc = const Value.absent(),
  });
  FormatImagesCompanion.insert({
    @required int listId,
    @required String pp,
    @required String vc,
  })  : listId = Value(listId),
        pp = Value(pp),
        vc = Value(vc);
  FormatImagesCompanion copyWith(
      {Value<int> listId, Value<String> pp, Value<String> vc}) {
    return FormatImagesCompanion(
      listId: listId ?? this.listId,
      pp: pp ?? this.pp,
      vc: vc ?? this.vc,
    );
  }
}

class $FormatImagesTable extends FormatImages
    with TableInfo<$FormatImagesTable, FormatImage> {
  final GeneratedDatabase _db;
  final String _alias;
  $FormatImagesTable(this._db, [this._alias]);
  final VerificationMeta _listIdMeta = const VerificationMeta('listId');
  GeneratedIntColumn _listId;
  @override
  GeneratedIntColumn get listId => _listId ??= _constructListId();
  GeneratedIntColumn _constructListId() {
    return GeneratedIntColumn(
      'list_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ppMeta = const VerificationMeta('pp');
  GeneratedTextColumn _pp;
  @override
  GeneratedTextColumn get pp => _pp ??= _constructPp();
  GeneratedTextColumn _constructPp() {
    return GeneratedTextColumn(
      'pp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _vcMeta = const VerificationMeta('vc');
  GeneratedTextColumn _vc;
  @override
  GeneratedTextColumn get vc => _vc ??= _constructVc();
  GeneratedTextColumn _constructVc() {
    return GeneratedTextColumn(
      'vc',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [listId, pp, vc];
  @override
  $FormatImagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'format_images';
  @override
  final String actualTableName = 'format_images';
  @override
  VerificationContext validateIntegrity(FormatImagesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.listId.present) {
      context.handle(
          _listIdMeta, listId.isAcceptableValue(d.listId.value, _listIdMeta));
    } else if (listId.isRequired && isInserting) {
      context.missing(_listIdMeta);
    }
    if (d.pp.present) {
      context.handle(_ppMeta, pp.isAcceptableValue(d.pp.value, _ppMeta));
    } else if (pp.isRequired && isInserting) {
      context.missing(_ppMeta);
    }
    if (d.vc.present) {
      context.handle(_vcMeta, vc.isAcceptableValue(d.vc.value, _vcMeta));
    } else if (vc.isRequired && isInserting) {
      context.missing(_vcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  FormatImage map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FormatImage.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FormatImagesCompanion d) {
    final map = <String, Variable>{};
    if (d.listId.present) {
      map['list_id'] = Variable<int, IntType>(d.listId.value);
    }
    if (d.pp.present) {
      map['pp'] = Variable<String, StringType>(d.pp.value);
    }
    if (d.vc.present) {
      map['vc'] = Variable<String, StringType>(d.vc.value);
    }
    return map;
  }

  @override
  $FormatImagesTable createAlias(String alias) {
    return $FormatImagesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TodosTable _todos;
  $TodosTable get todos => _todos ??= $TodosTable(this);
  $ListProduitsTable _listProduits;
  $ListProduitsTable get listProduits =>
      _listProduits ??= $ListProduitsTable(this);
  $TarifsTable _tarifs;
  $TarifsTable get tarifs => _tarifs ??= $TarifsTable(this);
  $ProduitsTable _produits;
  $ProduitsTable get produits => _produits ??= $ProduitsTable(this);
  $FormatImagesTable _formatImages;
  $FormatImagesTable get formatImages =>
      _formatImages ??= $FormatImagesTable(this);
  TodosDao _todosDao;
  TodosDao get todosDao => _todosDao ??= TodosDao(this as MyDatabase);
  @override
  List<TableInfo> get allTables =>
      [todos, listProduits, tarifs, produits, formatImages];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TodosDaoMixin on DatabaseAccessor<MyDatabase> {
  $TodosTable get todos => db.todos;
  $ListProduitsTable get listProduits => db.listProduits;
  $TarifsTable get tarifs => db.tarifs;
  $ProduitsTable get produits => db.produits;
  $FormatImagesTable get formatImages => db.formatImages;
}
