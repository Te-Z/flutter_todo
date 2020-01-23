// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    login: json['login'] as String,
    id: json['id'] as int,
    nodeId: json['nodeId'] as String,
    avatarUrl: json['avatarUrl'] as String,
    gravatarId: json['gravatarId'] as String,
    url: json['url'] as String,
    htmlUrl: json['htmlUrl'] as String,
    followersUrl: json['followersUrl'] as String,
    followingUrl: json['followingUrl'] as String,
    gistsUrl: json['gistsUrl'] as String,
    starredUrl: json['starredUrl'] as String,
    subscriptionsUrl: json['subscriptionsUrl'] as String,
    organizationsUrl: json['organizationsUrl'] as String,
    reposUrl: json['reposUrl'] as String,
    eventsUrl: json['eventsUrl'] as String,
    receivedEventsUrl: json['receivedEventsUrl'] as String,
    type: json['type'] as String,
    siteAdmin: json['siteAdmin'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'nodeId': instance.nodeId,
      'avatarUrl': instance.avatarUrl,
      'gravatarId': instance.gravatarId,
      'url': instance.url,
      'htmlUrl': instance.htmlUrl,
      'followersUrl': instance.followersUrl,
      'followingUrl': instance.followingUrl,
      'gistsUrl': instance.gistsUrl,
      'starredUrl': instance.starredUrl,
      'subscriptionsUrl': instance.subscriptionsUrl,
      'organizationsUrl': instance.organizationsUrl,
      'reposUrl': instance.reposUrl,
      'eventsUrl': instance.eventsUrl,
      'receivedEventsUrl': instance.receivedEventsUrl,
      'type': instance.type,
      'siteAdmin': instance.siteAdmin,
    };

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UserDaoMixin on DatabaseAccessor<MyDatabase> {
  Users _users;
  Users get users => _users ??= Users(db);
  Future upsert(User instance) {
    return transaction(() async {
      await into(users).insert(instance, orReplace: true);
    });
  }

  Future<List<User>> loadAll(
      {WhereFilter<Users> where,
      int limit,
      int offset = 0,
      List<OrderClauseGenerator<Users>> orderBy}) {
    final statement = select(users);
    if (where != null) {
      statement.where(where);
    }
    if (orderBy != null) {
      statement.orderBy(orderBy);
    }
    final joins = users.getJoins();
    if (joins.length == 0) {
      if (limit != null) {
        statement.limit(limit, offset: offset);
      }
      return statement.get();
    } else {
      final joinedStatement = statement.join(joins);
      if (limit != null) {
        joinedStatement.limit(limit, offset: offset);
      }
      return joinedStatement.get().then((rows) {
        return rows.map((row) => row.readTable(users)).toList();
      });
    }
  }

  Future<User> load(key) async {
    final statement = select(users);
    statement.where((table) => table.primaryKey.first.equals(key));
    final joins = users.getJoins();
    final list = await (joins.length == 0
        ? statement.get()
        : statement.join(joins).get().then((rows) {
            return rows.map((row) => row.readTable(users)).toList();
          }));
    return list.length > 0 ? list.first : null;
  }

  Future<int> partialUpdate(UsersCompanion companion,
      {WhereFilter<Users> where}) {
    final statement = update(users);
    if (where != null) {
      statement.where(where);
    }
    return statement.write(companion);
  }

  List<TableInfo> get tables => [users];
}
UsersCompanion _$createCompanion(User instance, bool nullToAbsent) {
  return UsersCompanion(
    login: instance.login == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.login),
    id: instance.id == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.id),
    nodeId: instance.nodeId == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.nodeId),
    avatarUrl: instance.avatarUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.avatarUrl),
    gravatarId: instance.gravatarId == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.gravatarId),
    url: instance.url == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.url),
    htmlUrl: instance.htmlUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.htmlUrl),
    followersUrl: instance.followersUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.followersUrl),
    followingUrl: instance.followingUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.followingUrl),
    gistsUrl: instance.gistsUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.gistsUrl),
    starredUrl: instance.starredUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.starredUrl),
    subscriptionsUrl: instance.subscriptionsUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.subscriptionsUrl),
    organizationsUrl: instance.organizationsUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.organizationsUrl),
    reposUrl: instance.reposUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.reposUrl),
    eventsUrl: instance.eventsUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.eventsUrl),
    receivedEventsUrl: instance.receivedEventsUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.receivedEventsUrl),
    type: instance.type == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.type),
    siteAdmin: instance.siteAdmin == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.siteAdmin),
  );
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> login;
  final Value<int> id;
  final Value<String> nodeId;
  final Value<String> avatarUrl;
  final Value<String> gravatarId;
  final Value<String> url;
  final Value<String> htmlUrl;
  final Value<String> followersUrl;
  final Value<String> followingUrl;
  final Value<String> gistsUrl;
  final Value<String> starredUrl;
  final Value<String> subscriptionsUrl;
  final Value<String> organizationsUrl;
  final Value<String> reposUrl;
  final Value<String> eventsUrl;
  final Value<String> receivedEventsUrl;
  final Value<String> type;
  final Value<bool> siteAdmin;
  const UsersCompanion({
    this.login = const Value.absent(),
    this.id = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.gravatarId = const Value.absent(),
    this.url = const Value.absent(),
    this.htmlUrl = const Value.absent(),
    this.followersUrl = const Value.absent(),
    this.followingUrl = const Value.absent(),
    this.gistsUrl = const Value.absent(),
    this.starredUrl = const Value.absent(),
    this.subscriptionsUrl = const Value.absent(),
    this.organizationsUrl = const Value.absent(),
    this.reposUrl = const Value.absent(),
    this.eventsUrl = const Value.absent(),
    this.receivedEventsUrl = const Value.absent(),
    this.type = const Value.absent(),
    this.siteAdmin = const Value.absent(),
  });
  UsersCompanion.insert({
    @required String login,
    this.id = const Value.absent(),
    @required String nodeId,
    @required String avatarUrl,
    @required String gravatarId,
    @required String url,
    @required String htmlUrl,
    @required String followersUrl,
    @required String followingUrl,
    @required String gistsUrl,
    @required String starredUrl,
    @required String subscriptionsUrl,
    @required String organizationsUrl,
    @required String reposUrl,
    @required String eventsUrl,
    @required String receivedEventsUrl,
    @required String type,
    @required bool siteAdmin,
  })  : login = Value(login),
        nodeId = Value(nodeId),
        avatarUrl = Value(avatarUrl),
        gravatarId = Value(gravatarId),
        url = Value(url),
        htmlUrl = Value(htmlUrl),
        followersUrl = Value(followersUrl),
        followingUrl = Value(followingUrl),
        gistsUrl = Value(gistsUrl),
        starredUrl = Value(starredUrl),
        subscriptionsUrl = Value(subscriptionsUrl),
        organizationsUrl = Value(organizationsUrl),
        reposUrl = Value(reposUrl),
        eventsUrl = Value(eventsUrl),
        receivedEventsUrl = Value(receivedEventsUrl),
        type = Value(type),
        siteAdmin = Value(siteAdmin);
  UsersCompanion copyWith(
      {Value<String> login,
      Value<int> id,
      Value<String> nodeId,
      Value<String> avatarUrl,
      Value<String> gravatarId,
      Value<String> url,
      Value<String> htmlUrl,
      Value<String> followersUrl,
      Value<String> followingUrl,
      Value<String> gistsUrl,
      Value<String> starredUrl,
      Value<String> subscriptionsUrl,
      Value<String> organizationsUrl,
      Value<String> reposUrl,
      Value<String> eventsUrl,
      Value<String> receivedEventsUrl,
      Value<String> type,
      Value<bool> siteAdmin}) {
    return UsersCompanion(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gravatarId: gravatarId ?? this.gravatarId,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      siteAdmin: siteAdmin ?? this.siteAdmin,
    );
  }
}

class Users extends Table with TableInfo<Users, User> {
  final GeneratedDatabase _db;
  final String _alias;
  Users(this._db, [this._alias]);
  final VerificationMeta _loginMeta = const VerificationMeta('login');
  GeneratedTextColumn _login;
  GeneratedTextColumn get login => _login ??= _constructLogin();
  GeneratedTextColumn _constructLogin() {
    return GeneratedTextColumn(
      'login',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  GeneratedTextColumn _nodeId;
  GeneratedTextColumn get nodeId => _nodeId ??= _constructNodeId();
  GeneratedTextColumn _constructNodeId() {
    return GeneratedTextColumn(
      'node_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _avatarUrlMeta = const VerificationMeta('avatarUrl');
  GeneratedTextColumn _avatarUrl;
  GeneratedTextColumn get avatarUrl => _avatarUrl ??= _constructAvatarUrl();
  GeneratedTextColumn _constructAvatarUrl() {
    return GeneratedTextColumn(
      'avatar_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _gravatarIdMeta = const VerificationMeta('gravatarId');
  GeneratedTextColumn _gravatarId;
  GeneratedTextColumn get gravatarId => _gravatarId ??= _constructGravatarId();
  GeneratedTextColumn _constructGravatarId() {
    return GeneratedTextColumn(
      'gravatar_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _htmlUrlMeta = const VerificationMeta('htmlUrl');
  GeneratedTextColumn _htmlUrl;
  GeneratedTextColumn get htmlUrl => _htmlUrl ??= _constructHtmlUrl();
  GeneratedTextColumn _constructHtmlUrl() {
    return GeneratedTextColumn(
      'html_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followersUrlMeta =
      const VerificationMeta('followersUrl');
  GeneratedTextColumn _followersUrl;
  GeneratedTextColumn get followersUrl =>
      _followersUrl ??= _constructFollowersUrl();
  GeneratedTextColumn _constructFollowersUrl() {
    return GeneratedTextColumn(
      'followers_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followingUrlMeta =
      const VerificationMeta('followingUrl');
  GeneratedTextColumn _followingUrl;
  GeneratedTextColumn get followingUrl =>
      _followingUrl ??= _constructFollowingUrl();
  GeneratedTextColumn _constructFollowingUrl() {
    return GeneratedTextColumn(
      'following_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _gistsUrlMeta = const VerificationMeta('gistsUrl');
  GeneratedTextColumn _gistsUrl;
  GeneratedTextColumn get gistsUrl => _gistsUrl ??= _constructGistsUrl();
  GeneratedTextColumn _constructGistsUrl() {
    return GeneratedTextColumn(
      'gists_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _starredUrlMeta = const VerificationMeta('starredUrl');
  GeneratedTextColumn _starredUrl;
  GeneratedTextColumn get starredUrl => _starredUrl ??= _constructStarredUrl();
  GeneratedTextColumn _constructStarredUrl() {
    return GeneratedTextColumn(
      'starred_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subscriptionsUrlMeta =
      const VerificationMeta('subscriptionsUrl');
  GeneratedTextColumn _subscriptionsUrl;
  GeneratedTextColumn get subscriptionsUrl =>
      _subscriptionsUrl ??= _constructSubscriptionsUrl();
  GeneratedTextColumn _constructSubscriptionsUrl() {
    return GeneratedTextColumn(
      'subscriptions_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _organizationsUrlMeta =
      const VerificationMeta('organizationsUrl');
  GeneratedTextColumn _organizationsUrl;
  GeneratedTextColumn get organizationsUrl =>
      _organizationsUrl ??= _constructOrganizationsUrl();
  GeneratedTextColumn _constructOrganizationsUrl() {
    return GeneratedTextColumn(
      'organizations_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _reposUrlMeta = const VerificationMeta('reposUrl');
  GeneratedTextColumn _reposUrl;
  GeneratedTextColumn get reposUrl => _reposUrl ??= _constructReposUrl();
  GeneratedTextColumn _constructReposUrl() {
    return GeneratedTextColumn(
      'repos_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _eventsUrlMeta = const VerificationMeta('eventsUrl');
  GeneratedTextColumn _eventsUrl;
  GeneratedTextColumn get eventsUrl => _eventsUrl ??= _constructEventsUrl();
  GeneratedTextColumn _constructEventsUrl() {
    return GeneratedTextColumn(
      'events_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _receivedEventsUrlMeta =
      const VerificationMeta('receivedEventsUrl');
  GeneratedTextColumn _receivedEventsUrl;
  GeneratedTextColumn get receivedEventsUrl =>
      _receivedEventsUrl ??= _constructReceivedEventsUrl();
  GeneratedTextColumn _constructReceivedEventsUrl() {
    return GeneratedTextColumn(
      'received_events_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _siteAdminMeta = const VerificationMeta('siteAdmin');
  GeneratedBoolColumn _siteAdmin;
  GeneratedBoolColumn get siteAdmin => _siteAdmin ??= _constructSiteAdmin();
  GeneratedBoolColumn _constructSiteAdmin() {
    return GeneratedBoolColumn(
      'site_admin',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        login,
        id,
        nodeId,
        avatarUrl,
        gravatarId,
        url,
        htmlUrl,
        followersUrl,
        followingUrl,
        gistsUrl,
        starredUrl,
        subscriptionsUrl,
        organizationsUrl,
        reposUrl,
        eventsUrl,
        receivedEventsUrl,
        type,
        siteAdmin
      ];
  @override
  Users get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.login.present) {
      context.handle(
          _loginMeta, login.isAcceptableValue(d.login.value, _loginMeta));
    } else if (login.isRequired && isInserting) {
      context.missing(_loginMeta);
    }
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.nodeId.present) {
      context.handle(
          _nodeIdMeta, nodeId.isAcceptableValue(d.nodeId.value, _nodeIdMeta));
    } else if (nodeId.isRequired && isInserting) {
      context.missing(_nodeIdMeta);
    }
    if (d.avatarUrl.present) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableValue(d.avatarUrl.value, _avatarUrlMeta));
    } else if (avatarUrl.isRequired && isInserting) {
      context.missing(_avatarUrlMeta);
    }
    if (d.gravatarId.present) {
      context.handle(_gravatarIdMeta,
          gravatarId.isAcceptableValue(d.gravatarId.value, _gravatarIdMeta));
    } else if (gravatarId.isRequired && isInserting) {
      context.missing(_gravatarIdMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
    } else if (url.isRequired && isInserting) {
      context.missing(_urlMeta);
    }
    if (d.htmlUrl.present) {
      context.handle(_htmlUrlMeta,
          htmlUrl.isAcceptableValue(d.htmlUrl.value, _htmlUrlMeta));
    } else if (htmlUrl.isRequired && isInserting) {
      context.missing(_htmlUrlMeta);
    }
    if (d.followersUrl.present) {
      context.handle(
          _followersUrlMeta,
          followersUrl.isAcceptableValue(
              d.followersUrl.value, _followersUrlMeta));
    } else if (followersUrl.isRequired && isInserting) {
      context.missing(_followersUrlMeta);
    }
    if (d.followingUrl.present) {
      context.handle(
          _followingUrlMeta,
          followingUrl.isAcceptableValue(
              d.followingUrl.value, _followingUrlMeta));
    } else if (followingUrl.isRequired && isInserting) {
      context.missing(_followingUrlMeta);
    }
    if (d.gistsUrl.present) {
      context.handle(_gistsUrlMeta,
          gistsUrl.isAcceptableValue(d.gistsUrl.value, _gistsUrlMeta));
    } else if (gistsUrl.isRequired && isInserting) {
      context.missing(_gistsUrlMeta);
    }
    if (d.starredUrl.present) {
      context.handle(_starredUrlMeta,
          starredUrl.isAcceptableValue(d.starredUrl.value, _starredUrlMeta));
    } else if (starredUrl.isRequired && isInserting) {
      context.missing(_starredUrlMeta);
    }
    if (d.subscriptionsUrl.present) {
      context.handle(
          _subscriptionsUrlMeta,
          subscriptionsUrl.isAcceptableValue(
              d.subscriptionsUrl.value, _subscriptionsUrlMeta));
    } else if (subscriptionsUrl.isRequired && isInserting) {
      context.missing(_subscriptionsUrlMeta);
    }
    if (d.organizationsUrl.present) {
      context.handle(
          _organizationsUrlMeta,
          organizationsUrl.isAcceptableValue(
              d.organizationsUrl.value, _organizationsUrlMeta));
    } else if (organizationsUrl.isRequired && isInserting) {
      context.missing(_organizationsUrlMeta);
    }
    if (d.reposUrl.present) {
      context.handle(_reposUrlMeta,
          reposUrl.isAcceptableValue(d.reposUrl.value, _reposUrlMeta));
    } else if (reposUrl.isRequired && isInserting) {
      context.missing(_reposUrlMeta);
    }
    if (d.eventsUrl.present) {
      context.handle(_eventsUrlMeta,
          eventsUrl.isAcceptableValue(d.eventsUrl.value, _eventsUrlMeta));
    } else if (eventsUrl.isRequired && isInserting) {
      context.missing(_eventsUrlMeta);
    }
    if (d.receivedEventsUrl.present) {
      context.handle(
          _receivedEventsUrlMeta,
          receivedEventsUrl.isAcceptableValue(
              d.receivedEventsUrl.value, _receivedEventsUrlMeta));
    } else if (receivedEventsUrl.isRequired && isInserting) {
      context.missing(_receivedEventsUrlMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    if (d.siteAdmin.present) {
      context.handle(_siteAdminMeta,
          siteAdmin.isAcceptableValue(d.siteAdmin.value, _siteAdminMeta));
    } else if (siteAdmin.isRequired && isInserting) {
      context.missing(_siteAdminMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.login.present) {
      map['login'] = Variable<String, StringType>(d.login.value);
    }
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.nodeId.present) {
      map['node_id'] = Variable<String, StringType>(d.nodeId.value);
    }
    if (d.avatarUrl.present) {
      map['avatar_url'] = Variable<String, StringType>(d.avatarUrl.value);
    }
    if (d.gravatarId.present) {
      map['gravatar_id'] = Variable<String, StringType>(d.gravatarId.value);
    }
    if (d.url.present) {
      map['url'] = Variable<String, StringType>(d.url.value);
    }
    if (d.htmlUrl.present) {
      map['html_url'] = Variable<String, StringType>(d.htmlUrl.value);
    }
    if (d.followersUrl.present) {
      map['followers_url'] = Variable<String, StringType>(d.followersUrl.value);
    }
    if (d.followingUrl.present) {
      map['following_url'] = Variable<String, StringType>(d.followingUrl.value);
    }
    if (d.gistsUrl.present) {
      map['gists_url'] = Variable<String, StringType>(d.gistsUrl.value);
    }
    if (d.starredUrl.present) {
      map['starred_url'] = Variable<String, StringType>(d.starredUrl.value);
    }
    if (d.subscriptionsUrl.present) {
      map['subscriptions_url'] =
          Variable<String, StringType>(d.subscriptionsUrl.value);
    }
    if (d.organizationsUrl.present) {
      map['organizations_url'] =
          Variable<String, StringType>(d.organizationsUrl.value);
    }
    if (d.reposUrl.present) {
      map['repos_url'] = Variable<String, StringType>(d.reposUrl.value);
    }
    if (d.eventsUrl.present) {
      map['events_url'] = Variable<String, StringType>(d.eventsUrl.value);
    }
    if (d.receivedEventsUrl.present) {
      map['received_events_url'] =
          Variable<String, StringType>(d.receivedEventsUrl.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.siteAdmin.present) {
      map['site_admin'] = Variable<bool, BoolType>(d.siteAdmin.value);
    }
    return map;
  }

  User fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final joinInfo = buildJoinInfo();
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    if ($primaryKey.length > 0) {
      final primaryKeyName = $primaryKey.first.$name;
      if (data['${effectivePrefix}$primaryKeyName'] == null) {
        return null;
      }
    }
    User model = User();
    model.login =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}login']);
    model.id = intType.mapFromDatabaseResponse(data['${effectivePrefix}id']);
    model.nodeId =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}node_id']);
    model.avatarUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}avatar_url']);
    model.gravatarId = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}gravatar_id']);
    model.url =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']);
    model.htmlUrl =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}html_url']);
    model.followersUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}followers_url']);
    model.followingUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}following_url']);
    model.gistsUrl =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}gists_url']);
    model.starredUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}starred_url']);
    model.subscriptionsUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}subscriptions_url']);
    model.organizationsUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}organizations_url']);
    model.reposUrl =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}repos_url']);
    model.eventsUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}events_url']);
    model.receivedEventsUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}received_events_url']);
    model.type =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']);
    model.siteAdmin =
        boolType.mapFromDatabaseResponse(data['${effectivePrefix}site_admin']);
    return model;
  }

  @override
  Map<GeneratedColumn, TableInfo> buildJoinInfo() {
    return {};
  }

  @override
  Users createAlias(String alias) {
    return Users(_db, alias);
  }

  @override
  final bool dontWriteConstraints = true;
}
