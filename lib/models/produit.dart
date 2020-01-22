import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/my_database.dart';

part 'produit.g.dart';

@JsonSerializable()
class Produit extends DataClass implements Insertable<Produit> {
  @EntityPrimaryKey()

  ;

  String id;

  @EntityToOne(AutreColorisDao, isNullable: false)
  List<AutreColoris> autreColoris;

  @EntityColumn()
  String coloris;

  @EntityColumn()
  String dateImplant;

  @EntityColumn()
  String familleWeb;

  @EntityColumn()
  String idImage;

  @EntityColumn()
  String libelle;

  @EntityColumn()
  String noteMoyenne;

  @EntityColumn()
  bool nouveaute;

  @EntityToOne(TarifsDao, isNullable: false)
  Tarifs tarifs;

  @EntityColumn()
  String url;

  Produit(
      this.id,
      this.autreColoris,
      this.coloris,
      this.dateImplant,
      this.familleWeb,
      this.idImage,
      this.libelle,
      this.noteMoyenne,
      this.nouveaute,
      this.tarifs,
      this.url);

  @override
  UpdateCompanion<Produit> createCompanion(bool nullToAbsent) =>
      _$createCompanion(this, nullToAbsent);

  @override
  Map<String, dynamic> toJson() => _$ProduitToJson(this);

  factory Produit.fromJson(Map<String, dynamic> json) =>
      _$ProduitFromJson(json);
}

@UseDao(entity: Produit)
class ProduitDao extends DatabaseAccessor<MyDatabase> with _$ProduitDaoMixin {
  ProduitDao(MyDatabase db) : super(db);

  Future<int> insertProduit(ProduitCompanion companion) =>
      update(Produit).write(companion);
}