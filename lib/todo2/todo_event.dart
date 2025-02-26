import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object> get props => [];
}

// Thêm công việc
class AddTodo extends TodoEvent {
  final String task;
  const AddTodo(this.task);

  @override
  List<Object> get props => [task];
}

// Xóa công việc
class RemoveTodo extends TodoEvent {
  final int index;
  const RemoveTodo(this.index);

  @override
  List<Object> get props => [index];
}
