import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/photo_bloc.dart';
import 'package:todo_poc/blocs/photo_event.dart';
import 'package:todo_poc/blocs/photo_state.dart';
import 'package:todo_poc/models/photo.dart';
import 'package:todo_poc/ui/network_screen.dart';
import 'package:todo_poc/ui/sqlite_screen.dart';

void backgroundFetchHeadlessTask() async {
  print('[BackgroundFetch] Headless event received.');
  BackgroundFetch.finish();
}

void main() {
  runApp(MyApp());
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

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

  Future<void> initPlatformState() async {
    /// Configuration de BackgroundFetch
    BackgroundFetch.configure(BackgroundFetchConfig(
        minimumFetchInterval: 15, /// Sur iOS et Android l'intervale minimale est de 15 minutes
        stopOnTerminate: false, /// Laisse la tâche active quand l'application se ferme
        enableHeadless: true, /// Laisse la tâche active quand l'application se ferme (Android only)
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: BackgroundFetchConfig.NETWORK_TYPE_ANY
    ), () async {

      /// Callback contenant l'action à effectuer pendant que l'application est fermée
      PhotoBloc _bloc = PhotoBloc();

      _bloc.add(AddAllPhotoFromNetworkToDB());

      /// IMPORTANT: Vous devez signaler explicitement la fin de la tâche sous peine de voir l'application pénalisée par l'OS
      /// du fait d'une tâche trop longue en background
      BackgroundFetch.finish();

    }).then((int status) {

      print('[BackgroundFetch] configure success: $status');
    }).catchError((e) {

      print('[BackgroundFetch] configure ERROR: $e');

    });

    /// Si le widget a été retirer de l'arborescence pendant que la tâche était en cours
    /// il est mieux d'abandonner la réponse plutôt que d'appeler setState pour rafraichir notre
    /// interface non existante
    if (!mounted) return;
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () => BackgroundFetch.start().then((int status) {
                print('[BackgroundFetch] start success: $status');
              }).catchError((e) {
                print('[BackgroundFetch] start FAILURE: $e');
              }),
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () => BackgroundFetch.stop().then((int status) {
                print('[BackgroundFetch] start success: $status');
              }).catchError((e) {
                print('[BackgroundFetch] start FAILURE: $e');
              }),
            ),
          ],
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
