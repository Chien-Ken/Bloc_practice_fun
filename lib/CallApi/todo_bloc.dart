import 'package:bloc_practice/CallApi/todo_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService todoService;

  TodoBloc(this.todoService) : super(TodoInitial()) {
    on<FetchTodos>(_onFetchTodos);
  }

  Future<void> _onFetchTodos(FetchTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());

    try {
      final todos = await todoService.fetchTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
