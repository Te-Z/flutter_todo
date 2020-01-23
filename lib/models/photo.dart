import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;


  Photo({this.id, this.albumId, this.title, this.url, this.thumbnailUrl});

  @override
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}