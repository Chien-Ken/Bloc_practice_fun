import 'package:bloc_practice/todo2/todo_event.dart';
import 'package:bloc_practice/todo2/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final List<String>_todos = [];

  TodoBloc() : super(const TodoState([])) {
    // Xử lý sự kiện AddTodo
    on<AddTodo>((event, emit) {
     _todos.add(event.task);
      emit(TodoState(List.from(_todos)));
    });

    // Xử lý sự kiện RemoveTodo
    on<RemoveTodo>((event, emit) {     
     _todos.removeAt(event.index);
      emit(TodoState(List.from(_todos)));
    });
  }


  // ✅ Getter để lấy danh sách ảnh đã like
  List<String> get todo => _todos;

}
