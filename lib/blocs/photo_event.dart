import 'package:equatable/equatable.dart';
import 'package:todo_poc/models/photo.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class LoadPhotosFromNetwork extends PhotoEvent {}
class LoadPhotosFromDB extends PhotoEvent {}

class AddPhoto extends PhotoEvent {
  final Photo photo;

  const AddPhoto(this.photo);

  @override
  List<Object> get props => [photo];

  @override
  String toString() => 'AddPhoto { user: $photo }';
}

class UpdatePhoto extends PhotoEvent {
  final Photo photo;

  const UpdatePhoto(this.photo);

  @override
  List<Object> get props => [photo];

  @override
  String toString() => 'UpdatePhoto { updatedPhoto: $photo }';
}

class DeletePhoto extends PhotoEvent {
  final Photo photo;

  const DeletePhoto(this.photo);

  @override
  List<Object> get props => [photo];

  @override
  String toString() => 'DeletePhoto { user: $photo }';
}

class ClearCompleted extends PhotoEvent {}

class ToggleAll extends PhotoEvent {}