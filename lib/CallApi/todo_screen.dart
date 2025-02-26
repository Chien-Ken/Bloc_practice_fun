import 'package:bloc_practice/CallApi/todo_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';


class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(TodoService())..add(FetchTodos()), // Inject service vào BLoC
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TodoLoaded) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  final todo = state.todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    trailing: Icon(
                      todo.completed ? Icons.check_circle : Icons.circle_outlined,
                      color: todo.completed ? Colors.green : Colors.grey,
                    ),
                  );
                },
              );
            } else if (state is TodoError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
