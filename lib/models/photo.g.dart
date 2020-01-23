// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    id: json['id'] as int,
    albumId: json['albumId'] as int,
    title: json['title'] as String,
    url: json['url'] as String,
    thumbnailUrl: json['thumbnailUrl'] as String,
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'albumId': instance.albumId,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PhotoDaoMixin on DatabaseAccessor<MyDatabase> {
  Photos _photos;
  Photos get photos => _photos ??= Photos(db);
  Future upsert(Photo instance) {
    return transaction(() async {
      await into(photos).insert(instance, orReplace: true);
    });
  }

  Future<List<Photo>> loadAll(
      {WhereFilter<Photos> where,
      int limit,
      int offset = 0,
      List<OrderClauseGenerator<Photos>> orderBy}) {
    final statement = select(photos);
    if (where != null) {
      statement.where(where);
    }
    if (orderBy != null) {
      statement.orderBy(orderBy);
    }
    final joins = photos.getJoins();
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
        return rows.map((row) => row.readTable(photos)).toList();
      });
    }
  }

  Future<Photo> load(key) async {
    final statement = select(photos);
    statement.where((table) => table.primaryKey.first.equals(key));
    final joins = photos.getJoins();
    final list = await (joins.length == 0
        ? statement.get()
        : statement.join(joins).get().then((rows) {
            return rows.map((row) => row.readTable(photos)).toList();
          }));
    return list.length > 0 ? list.first : null;
  }

  Future<int> partialUpdate(PhotosCompanion companion,
      {WhereFilter<Photos> where}) {
    final statement = update(photos);
    if (where != null) {
      statement.where(where);
    }
    return statement.write(companion);
  }

  List<TableInfo> get tables => [photos];
}
PhotosCompanion _$createCompanion(Photo instance, bool nullToAbsent) {
  return PhotosCompanion(
    id: instance.id == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.id),
    albumId: instance.albumId == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.albumId),
    title: instance.title == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.title),
    url: instance.url == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.url),
    thumbnailUrl: instance.thumbnailUrl == null && nullToAbsent
        ? const Value.absent()
        : Value(instance.thumbnailUrl),
  );
}

class PhotosCompanion extends UpdateCompanion<Photo> {
  final Value<int> id;
  final Value<int> albumId;
  final Value<String> title;
  final Value<String> url;
  final Value<String> thumbnailUrl;
  const PhotosCompanion({
    this.id = const Value.absent(),
    this.albumId = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
  });
  PhotosCompanion.insert({
    this.id = const Value.absent(),
    @required int albumId,
    @required String title,
    @required String url,
    @required String thumbnailUrl,
  })  : albumId = Value(albumId),
        title = Value(title),
        url = Value(url),
        thumbnailUrl = Value(thumbnailUrl);
  PhotosCompanion copyWith(
      {Value<int> id,
      Value<int> albumId,
      Value<String> title,
      Value<String> url,
      Value<String> thumbnailUrl}) {
    return PhotosCompanion(
      id: id ?? this.id,
      albumId: albumId ?? this.albumId,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }
}

class Photos extends Table with TableInfo<Photos, Photo> {
  final GeneratedDatabase _db;
  final String _alias;
  Photos(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        declaredAsPrimaryKey: true);
  }

  final VerificationMeta _albumIdMeta = const VerificationMeta('albumId');
  GeneratedIntColumn _albumId;
  GeneratedIntColumn get albumId => _albumId ??= _constructAlbumId();
  GeneratedIntColumn _constructAlbumId() {
    return GeneratedIntColumn(
      'album_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
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

  final VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  GeneratedTextColumn _thumbnailUrl;
  GeneratedTextColumn get thumbnailUrl =>
      _thumbnailUrl ??= _constructThumbnailUrl();
  GeneratedTextColumn _constructThumbnailUrl() {
    return GeneratedTextColumn(
      'thumbnail_url',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, albumId, title, url, thumbnailUrl];
  @override
  Photos get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'photos';
  @override
  final String actualTableName = 'photos';
  @override
  VerificationContext validateIntegrity(PhotosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.albumId.present) {
      context.handle(_albumIdMeta,
          albumId.isAcceptableValue(d.albumId.value, _albumIdMeta));
    } else if (albumId.isRequired && isInserting) {
      context.missing(_albumIdMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
    } else if (url.isRequired && isInserting) {
      context.missing(_urlMeta);
    }
    if (d.thumbnailUrl.present) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableValue(
              d.thumbnailUrl.value, _thumbnailUrlMeta));
    } else if (thumbnailUrl.isRequired && isInserting) {
      context.missing(_thumbnailUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Photo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PhotosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.albumId.present) {
      map['album_id'] = Variable<int, IntType>(d.albumId.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.url.present) {
      map['url'] = Variable<String, StringType>(d.url.value);
    }
    if (d.thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String, StringType>(d.thumbnailUrl.value);
    }
    return map;
  }

  Photo fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final joinInfo = buildJoinInfo();
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    if ($primaryKey.length > 0) {
      final primaryKeyName = $primaryKey.first.$name;
      if (data['${effectivePrefix}$primaryKeyName'] == null) {
        return null;
      }
    }
    Photo model = Photo();
    model.id = intType.mapFromDatabaseResponse(data['${effectivePrefix}id']);
    model.albumId =
        intType.mapFromDatabaseResponse(data['${effectivePrefix}album_id']);
    model.title =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']);
    model.url =
        stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']);
    model.thumbnailUrl = stringType
        .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail_url']);
    return model;
  }

  @override
  Map<GeneratedColumn, TableInfo> buildJoinInfo() {
    return {};
  }

  @override
  Photos createAlias(String alias) {
    return Photos(_db, alias);
  }

  @override
  final bool dontWriteConstraints = true;
}
