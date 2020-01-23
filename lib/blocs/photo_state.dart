import 'package:equatable/equatable.dart';
import 'package:todo_poc/models/photo.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotosLoading extends PhotoState {}

class PhotosLoadedFromNetwork extends PhotoState {
  final List<Photo> photos;

  const PhotosLoadedFromNetwork([this.photos = const []]);

  @override
  List<Photo> get props => photos;
}

class PhotosLoadedFromDB extends PhotoState {
  final List<Photo> photos;

  const PhotosLoadedFromDB([this.photos = const []]);

  @override
  List<Photo> get props => photos;
}

class PhotosNotLoaded extends PhotoState {}