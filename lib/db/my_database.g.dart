// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as MyDatabase);
  @override
  List<TableInfo> get allTables => [...userDao.tables];
}
