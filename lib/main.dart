import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/photo_bloc.dart';
import 'package:todo_poc/blocs/photo_event.dart';
import 'package:todo_poc/blocs/photo_state.dart';
import 'package:todo_poc/models/photo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<PhotoBloc>(
        create: (context) => PhotoBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PhotoBloc _photoBloc;
  TextEditingController _photoController = TextEditingController();

  @override
  void dispose() {
    _photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _photoBloc = BlocProvider.of<PhotoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            /// DATA LISTE
            Expanded(
              child: BlocBuilder<PhotoBloc, PhotoState>(
                builder: (context, PhotoState state){
                  if(state is PhotosLoaded){
                    var list = (BlocProvider.of<PhotoBloc>(context).state as PhotosLoaded).photos;

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
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    );
                  } else {
                    _photoBloc.add(LoadPhotos());
                    return Text("Pas de données");
                  }
                },
              ),
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
