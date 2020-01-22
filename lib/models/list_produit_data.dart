import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/my_database.dart';
import 'package:todo_poc/models/format_image.dart';

part 'list_produit_data.g.dart';

@JsonSerializable()
class ListeProduitData extends DataClass implements Insertable<ListeProduitData> {
  @EntityPrimaryKey()
  int id;

  @EntityColumn()
  String devise;

  @EntityToOne(FormatImageDao, isNullable: true)
  FormatImage formatImage;

  @EntityColumn()
  String masque;

  @EntityColumn()
  int nbDecimales;

  @EntityColumn()
  String nouvelleCollection;

  @EntityColumn()
  String pathImage;

  @EntityColumn()
  List<Reference> refsOption;

  @EntityColumn()
  String separateurMillier;

  @EntityColumn()
  int ttc;

  @EntityColumn()
  int ttl;

  ListeProduitData(
      this.id,
      this.devise,
      this.formatImage,
      this.masque,
      this.nbDecimales,
      this.nouvelleCollection,
      this.pathImage,
      this.refsOption,
      this.separateurMillier,
      this.ttc,
      this.ttl);

  @override
  UpdateCompanion<ListeProduitData> createCompanion(bool nullToAbsent) => _$createCompanion(this, nullToAbsent);

  @override
  Map<String, dynamic> toJson() => _$ListeProduitDataToJson(this);

  factory ListeProduitData.fromJson(Map<String, dynamic> json) =>
      _$ListeProduitDataFromJson(json);
}

@UseDao(entity: ListeProduitData)
class ListeProduitDataDao extends DatabaseAccessor<MyDatabase> with _$ListeProduitDataDaoMixin {
  ListeProduitDataDao(MyDatabase db): super(db);

  Future<int> insertListProduit(ListeProduitDataCompanion companion) => update(listeProduitDatas).write(companion);
}