import 'package:flutter_bloc/flutter_bloc.dart';

enum TodoEvent { create, read, update, delete }

class TodoBloc extends Bloc<TodoEvent, >