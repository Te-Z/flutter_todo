import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/my_database.dart';

part 'tarifs.g.dart';

@JsonSerializable()
class Tarifs extends DataClass implements Insertable<Tarifs> {
  @EntityPrimaryKey();
  String id;

  @EntityColumn()
  String dateDebut;

  @EntityColumn()
  int decote;

  @EntityColumn()
  double prix;

  @EntityColumn()
  double prixBarre;

  @EntityColumn()
  int typeCom;

  @EntityColumn()
  String typePrix;

  @override
  UpdateCompanion<Tarifs> createCompanion(bool nullToAbsent) => _$createCompanion(this, nullToAbsent);

  @override
  Map<String, dynamic> toJson() => _$TarifsToJson(this);

  factory Tarifs.fromJson(Map<String, dynamic> json) => _$TarifsFromJson(json);
}

@UseDao(entity: Tarifs)
class TarifsDao extends DatabaseAccessor<MyDatabase> with _$TarifsDaoMixin {
  TarifsDao(MyDatabase db): super(db);

  Future<int> insertTarifs(TarifsCompanion companion) => update(Tarifs).write(companion);
}