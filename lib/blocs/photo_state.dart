import 'package:equatable/equatable.dart';
import 'package:todo_poc/models/photo.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotosLoading extends PhotoState {}

class PhotosLoaded extends PhotoState {
  final List<Photo> photos;

  const PhotosLoaded([this.photos = const []]);

  @override
  List<Photo> get props => photos;

  @override
  String toString() => 'UsersLoaded { users: $photos }';
}

class PhotosNotLoaded extends PhotoState {}