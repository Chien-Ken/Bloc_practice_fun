import 'dart:async';

import 'package:bloc_practice/Todo/todo_event.dart';
import 'package:bloc_practice/Todo/todo_state.dart';

class TodoBloc {
  List<Map<String, dynamic>> _todos = [];
    // Stream cho trạng thái
  final _todoStateController = StreamController<TodoState>();
  Stream<TodoState> get todoStream => _todoStateController.stream;

  // Stream cho sự kiện
  final _todoEventController = StreamController<TodoEvent>();
  Sink<TodoEvent> get todoEventSink => _todoEventController.sink;

  TodoBloc() {
    // Lắng nghe các sự kiện và gọi _mapEventToState khi có sự kiện mới
    _todoEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TodoEvent event) {
    if(event is AddTodo) {
      _handleAdd(event);
    }else if (event is RemoveTodo) {
      _handleRemove(event);
    }else if (event is ToggleTodo) {
      _handleToggle(event);
    }
      _todoStateController.sink.add(TodoState(List.from(_todos)));
  }

  void _handleAdd(AddTodo event) {
    _todos.add( {"title": event.todo, "completed": false});
  }

  void _handleRemove(RemoveTodo event) {
    _todos.removeAt(event.index);
  }
  void _handleToggle(ToggleTodo event) {
    _todos[event.index]["completed"] = !_todos[event.index]["completed"];
  }

   // Đóng Stream khi không cần dùng nữa
  void dispose() {
    _todoStateController.close();
    _todoEventController.close();
  }
  



}