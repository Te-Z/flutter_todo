import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_poc/db/my_database.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends DataClass implements Insertable<User>{
  @EntityColumn()
  String login;
  @EntityPrimaryKey()
  int id;
  @EntityColumn()
  String nodeId;
  @EntityColumn()
  String avatarUrl;
  @EntityColumn()
  String gravatarId;
  @EntityColumn()
  String url;
  @EntityColumn()
  String htmlUrl;
  @EntityColumn()
  String followersUrl;
  @EntityColumn()
  String followingUrl;
  @EntityColumn()
  String gistsUrl;
  @EntityColumn()
  String starredUrl;
  @EntityColumn()
  String subscriptionsUrl;
  @EntityColumn()
  String organizationsUrl;
  @EntityColumn()
  String reposUrl;
  @EntityColumn()
  String eventsUrl;
  @EntityColumn()
  String receivedEventsUrl;
  @EntityColumn()
  String type;
  @EntityColumn()
  bool siteAdmin;

  User({this.login, this.id, this.nodeId, this.avatarUrl, this.gravatarId,
      this.url, this.htmlUrl, this.followersUrl, this.followingUrl,
      this.gistsUrl, this.starredUrl, this.subscriptionsUrl,
      this.organizationsUrl, this.reposUrl, this.eventsUrl,
      this.receivedEventsUrl, this.type, this.siteAdmin});

  @override
  UpdateCompanion<User> createCompanion(bool nullToAbsent) =>
      _$createCompanion(this, nullToAbsent);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@UseDao(entity: User)
class UserDao extends DatabaseAccessor<MyDatabase> with _$UserDaoMixin {
  UserDao(MyDatabase db) : super(db);

  Future<int> insertUser(UsersCompanion companion) => update(users).write(companion);
  Future<List<User>> getAllUsers() => select(users).get();
}