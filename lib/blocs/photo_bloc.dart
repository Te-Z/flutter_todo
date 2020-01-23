import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/photo_event.dart';
import 'package:todo_poc/blocs/photo_repository.dart';
import 'package:todo_poc/blocs/photo_state.dart';
import 'package:todo_poc/models/photo.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotosRepository repository = PhotosRepository();

  @override
  PhotoState get initialState => PhotosLoading();

  @override
  Stream<PhotoState> mapEventToState(event) async*{
    print("mapEventToState = $event");
    if (event is LoadPhotos) {
      yield* _mapLoadPhotosToState();
    } else if (event is AddPhoto) {
      yield* _mapAddPhotosToState(event);
    }
  }

  Stream<PhotoState> _mapLoadPhotosToState() async* {
    try {
      final photos = await this.repository.getAllPhotos();
      yield PhotosLoaded(photos);
    } catch (e){
      print("_mapLoadPhotosToState: PhotosNotLoaded ==> $e");
      yield PhotosNotLoaded();
    }
  }

  Stream<PhotoState> _mapAddPhotosToState(AddPhoto event) async* {
    if(state is PhotosLoaded){
      final List<Photo> updatedPhotos = List.from((state as PhotosLoaded).photos)
          ..add(event.photo);

      yield PhotosLoaded(updatedPhotos);
      print("updatedPhotos[0]: ${updatedPhotos[0]}");
      repository.addPhotoEntry(updatedPhotos[0].createCompanion(true));
    }
  }

}
