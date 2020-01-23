import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/photo_bloc.dart';
import 'package:todo_poc/blocs/photo_event.dart';
import 'package:todo_poc/blocs/photo_state.dart';
import 'package:todo_poc/models/photo.dart';

class NetworkScreen extends StatefulWidget {
  @override
  _NetworkScreenState createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  PhotoBloc _photoBloc;
  TextEditingController _photoController = TextEditingController();

  @override
  void initState() {
    _photoBloc = BlocProvider.of<PhotoBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            /// DATA LISTE
            Expanded(
              child: BlocBuilder<PhotoBloc, PhotoState>(
                builder: (context, PhotoState state){
                  if(state is PhotosLoadedFromNetwork){
                    var list = (BlocProvider.of<PhotoBloc>(context).state as PhotosLoadedFromNetwork).photos;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          child: Text("${list.length} items"),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (ctx, index) {
                                Photo photo = list[index];



                                return GestureDetector(
                                  onTap: () {
                                    print("adding photo ${photo.title}");
                                    _photoBloc.add(AddPhoto(photo));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8.0),
                                    child: ListTile(
                                      leading: Image.network(photo.thumbnailUrl),
                                      title: Text(photo.title),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    );

                  } else {
                    _photoBloc.add(LoadPhotosFromNetwork());
                    return Text("Pas de données");
                  }
                },
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_to_photos),
        onPressed: () => _photoBloc.add(AddAllPhotoFromNetworkToDB()),
      ),
    );
  }


}
