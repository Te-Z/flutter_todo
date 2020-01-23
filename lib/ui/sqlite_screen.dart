import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/photo_bloc.dart';
import 'package:todo_poc/blocs/photo_event.dart';
import 'package:todo_poc/blocs/photo_state.dart';
import 'package:todo_poc/models/photo.dart';

class SQLiteScreen extends StatefulWidget {
  @override
  _SQLiteScreenState createState() => _SQLiteScreenState();
}

class _SQLiteScreenState extends State<SQLiteScreen> {
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
    _photoBloc = BlocProvider.of<PhotoBloc>(context);

    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          /// DATA LISTE
          Expanded(
            child: BlocBuilder<PhotoBloc, PhotoState>(
              builder: (context, PhotoState state){
                if(state is PhotosLoadedFromDB){
                  var list = (BlocProvider.of<PhotoBloc>(context).state as PhotosLoadedFromDB).photos;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text("${list.length} items "),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (ctx, index) {
                              Photo photo = list[index];

                              return Container(
                                margin: EdgeInsets.only(top: 8.0),
                                child: ListTile(
                                  leading: Image.network(photo.thumbnailUrl),
                                  title: Text(photo.title),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _photoBloc.add(DeletePhoto(photo));
                                    },
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    ],
                  );

                } else {
                  _photoBloc.add(LoadPhotosFromDB());
                  return Text("Pas de données");
                }
              },
            ),
          ),

        ],
      ),
    );
  }
}
