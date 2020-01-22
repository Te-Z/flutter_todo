import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/my_database.dart';

part 'reference.g.dart';

@JsonSerializable()
class Reference extends DataClass implements Insertable<Reference> {
  @EntityPrimaryKey();
  String id;

  @EntityToOne(ProduitDao, isNullable:  false)
  Produit produit;

  Reference(this.id, this.produit);

  @override
  UpdateCompanion<Reference> createCompanion(bool nullToAbsent) => _$createCompanion(this, nullToAbsent);

  @override
  Map<String, dynamic> toJson() => _$ReferenceToJson(this);

  factory Reference.fromJson(Map<String, dynamic> json) => _$ReferenceFromJson(json);
}

@UseDao(entity: Reference)
class ReferenceDao extends DatabaseAccessor<MyDatabase> with _$ReferenceDaoMixin {
  ReferenceDao(MyDatabase db): super(db);

  Future<int> insertReference(ReferenceCompanion companion) => update(reference).write(companion);
}