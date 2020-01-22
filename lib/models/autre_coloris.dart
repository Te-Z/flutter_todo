import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/my_database.dart';

part 'autre_coloris.g.dart';

@JsonSerializable()
class AutreColoris extends DataClass implements Insertable<AutreColoris> {
  @EntityPrimaryKey();
  String id;

  List<String> autreColoris;

  @override
  UpdateCompanion<AutreColoris> createCompanion(bool nullToAbsent) => _$createCompanion(this, nullToAbsent);

  @override
  Map<String, dynamic> toJson() => _$AutreColorisToJson(this);

  factory AutreColoris.fromJson(Map<String, dynamic> json) => _$AutreColorisFromJson(json);
}

@UseDao(entity: AutreColoris)
class AutreColorisDao extends DatabaseAccessor<MyDatabase> with _$AutreColorisDaoMixin {
  AutreColorisDao(MyDatabase db): super(db);

  Future<int> insertAutreColoris(AutreColorisCompanion companion) => update(AutreColoris).write(companion);
}