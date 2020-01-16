import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_poc/blocs/todo_bloc.dart';
import 'package:todo_poc/blocs/todo_repository.dart';

import 'blocs/todo_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  TodosRepository _repository = TodosRepository();
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
        create: (context) => TodoBloc(_repository),
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

  @override
  Widget build(BuildContext context) {
    _todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, TodoState state){
          if(state is TodosLoaded){
            var list = (BlocProvider.of<TodoBloc>(context).state as TodosLoaded).todos;

            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx, index) => Text(list[index].id.toString())
            );
          } else return Text("Pas de données");
        },
      ),
      floatingActionButton: FloatingActionButton(

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
