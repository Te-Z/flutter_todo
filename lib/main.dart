import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/photo_bloc.dart';
import 'package:todo_poc/blocs/photo_event.dart';
import 'package:todo_poc/blocs/photo_state.dart';
import 'package:todo_poc/models/photo.dart';
import 'package:todo_poc/ui/network_screen.dart';
import 'package:todo_poc/ui/sqlite_screen.dart';

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
        child: MyHomePage(title: 'Demo synchro de bases'),
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.wifi), text: "API"),
              Tab(icon: Icon(Icons.memory), text: "SQLite")
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NetworkScreen(),
            SQLiteScreen()
          ],
        ),
      ),
    );
  }
}
