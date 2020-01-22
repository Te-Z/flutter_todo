import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/user_bloc.dart';
import 'package:todo_poc/blocs/user_event.dart';
import 'package:todo_poc/blocs/user_state.dart';

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
      home: BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
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
  UserBloc _userBloc;
  TextEditingController _userController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);

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
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, UserState state){
                  if(state is UsersLoaded){
                    var list = (BlocProvider.of<UserBloc>(context).state as UsersLoaded).users;

                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (ctx, index) => Row(
                          children: <Widget>[
                            Expanded(child: Text(list[index].login),),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _userBloc.add(DeleteUser(list[index])),
                            )
                          ],
                        )
                    );
                  } else {
                    _userBloc.add(LoadUsers());
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
