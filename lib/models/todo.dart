import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class Todo extends Equatable {
  final bool isComplete;
  final String id;
  final String note;
  final String task;

  Todo(this.task, {this.isComplete = false, this.note = '', this.id});

  @override
  String toString() {
    return 'Todo { complete: $isComplete, task: $task, note: $note, id: $id }';
  }

  @override
  List<Object> get props => [isComplete, id, note, task];
}