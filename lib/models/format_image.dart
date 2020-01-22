import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/my_database.dart';

part 'format_image.g.dart';

@JsonSerializable()
class FormatImage extends DataClass implements Insertable<FormatImage> {
  @EntityPrimaryKey()
  int id;

  @EntityColumn()
  String pp;

  @EntityColumn()
  String vc;

  FormatImage(this.id, this.pp, this.vc);

  @override
  UpdateCompanion<FormatImage> createCompanion(bool nullToAbsent) => _$createCompanion(this, nullToAbsent);

  @override
  Map<String, dynamic> toJson() => _$FormatImageToJson(this);

  factory FormatImage.fromJson(Map<String, dynamic> json) => _$FormatImageFromJson(json);
}

@UseDao(entity: FormatImage)
class FormatImageDao extends DatabaseAccessor<MyDatabase> with _$FormatImageDaoMixin {
  FormatImageDao(MyDatabase db): super(db);

  Future<int> insertFormatImage(FormatImageCompanion companion) => update(formatImage).write(companion);
}