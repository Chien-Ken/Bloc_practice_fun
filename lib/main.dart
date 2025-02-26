import 'package:bloc_practice/CallApi/todo_api.dart';
import 'package:bloc_practice/CallApi/todo_bloc.dart';
import 'package:bloc_practice/CallApi/todo_event.dart';
import 'package:bloc_practice/CallApi/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoBloc(TodoService())..add(FetchTodos()),
        child: TodoScreen(),
      ),
    );
  }
}
