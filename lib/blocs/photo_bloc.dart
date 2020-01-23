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
    } else {
      print("nope ==> $state");
    }
  }

}
