import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/todo/todo_bloc.dart';
import 'package:todo_poc/blocs/todo/todo_event.dart';
import 'package:todo_poc/blocs/todo/todo_repository.dart';
import 'package:todo_poc/db/my_database.dart';

import 'blocs/todo/todo_state.dart';

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
      home: BlocProvider<TodoBloc>(
        create: (context) => TodoBloc(TodosRepository(TodosDao(MyDatabase()))),
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
  TodoBloc _todoBloc;
  TextEditingController _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _todoBloc = BlocProvider.of<TodoBloc>(context);

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
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, TodoState state){
                  if(state is TodosLoaded){
                    var list = (BlocProvider.of<TodoBloc>(context).state as TodosLoaded).todos;

                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (ctx, index) => Row(
                          children: <Widget>[
                            Expanded(child: Text(list[index].note.toString()),),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _todoBloc.add(DeleteTodo(list[index])),
                            )
                          ],
                        )
                    );
                  } else {
                    _todoBloc.add(LoadTodos());
                    return Text("Pas de données");
                  }
                },
              ),
            ),

            /// Saisie
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        labelText: "Saisissez un texte"
                    ),
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _todoBloc.add(AddTodo(Todo(id: 0, isComplete: false, note: _todoController.text, task: "lol")));
                  },
                )
              ],
            )

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
