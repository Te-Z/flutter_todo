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
    if (event is LoadPhotosFromNetwork) {
      yield* _mapLoadPhotosFromNetworkToState();
    } else if (event is LoadPhotosFromDB) {
      yield* _mapLoadPhotosFromDBToState();
    } else if (event is AddPhoto) {
      yield* _mapAddPhotosToState(event);
    } else if(event is AddAllPhotoFromNetworkToDB){
      yield* _mapAddAllPhotoFromNetworkToDBToState();
    } else if (event is DeletePhoto){
      yield* _mapDeleteThisPhotoToState(event);
    }
  }

  Stream<PhotoState> _mapLoadPhotosFromNetworkToState() async* {
    try {
      final photos = await this.repository.getAllPhotosFromNetwork();
      yield PhotosLoadedFromNetwork(photos);
    } catch (e){
      print("_mapLoadPhotosToState: PhotosNotLoaded ==> $e");
      yield PhotosNotLoaded();
    }
  }

  Stream<PhotoState> _mapLoadPhotosFromDBToState() async* {
    try {

      final photos = await this.repository.getAllPhotosFromDB();
      print("_mapLoadPhotosFromDBToState: ${photos.length} photos found");
      yield PhotosLoadedFromDB(photos);
    } catch (e){
      print("_mapLoadPhotosToState: PhotosNotLoaded ==> $e");
      yield PhotosNotLoaded();
    }
  }

  Stream<PhotoState> _mapAddPhotosToState(AddPhoto event) async* {
    if(state is PhotosLoadedFromNetwork){
      final List<Photo> updatedPhotos = List.from((state as PhotosLoadedFromNetwork).photos)
          ..add(event.photo);

      yield PhotosLoadedFromDB(updatedPhotos);
      print("_mapAddPhotosToState: adding ${updatedPhotos[0].title} (${updatedPhotos.length} other photos)");
      repository.addPhotoEntry(event.photo).then((v) => print("insertion done $v")).catchError((e) => print("insertion failed => $e"));
    }
  }

  Stream<PhotoState> _mapDeleteThisPhotoToState(DeletePhoto event) async* {
    if(state is PhotosLoadedFromDB){
      final List<Photo> updatedPhotos = List.from((state as PhotosLoadedFromDB).photos)
        ..remove(event.photo);

      yield PhotosLoadedFromDB(updatedPhotos);
      print("_mapDeleteThisPhotoToState: deleting ${updatedPhotos[0].title} (${updatedPhotos.length} photos left)");
      repository.deletePhoto(event.photo).then((v) => print("insertion done $v")).catchError((e) => print("insertion failed => $e"));
    }
  }

  Stream<PhotoState> _mapAddAllPhotoFromNetworkToDBToState() async* {
    try {
      final photos = await this.repository.getAllPhotosFromNetwork();
      for(Photo photo in photos){
        repository.addPhotoEntry(photo)
            .then((_) => print("_mapAddAllPhotoFromNetworkToDB: photo ${photos.indexOf(photo) - 1} / ${photos.length}"))
            .catchError((e) => print("_mapAddAllPhotoFromNetworkToDB: error on photo ${photos.indexOf(photo) - 1} / ${photos.length} ==> $e"));
      }
      print("_mapAddAllPhotoFromNetworkToDB: DONE");
      yield PhotosLoadedFromDB(photos);
    } catch(e) {
      print("_mapLoadPhotosToState: PhotosNotLoaded ==> $e");
      yield PhotosNotLoaded();
    }
  }
}
