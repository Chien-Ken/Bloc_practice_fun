import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<String>> {
  TodoCubit() : super([]);

  void addTodo(String task) {
    if (task.isNotEmpty) {
      emit([...state, task]);
    }
  }

  void removeTodo(int index) {
    final newList = List<String>.from(state)..removeAt(index);
    emit(newList);
  }
}
