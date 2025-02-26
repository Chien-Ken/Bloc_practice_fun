
import 'package:bloc_practice/todo2/todo_bloc.dart';
import 'package:bloc_practice/todo2/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (_) => TodoBloc(),
      child: TodoScreen(),
      ),
    );
  }
}