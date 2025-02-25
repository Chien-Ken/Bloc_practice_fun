import 'package:bloc_practice/Counter/counter_bloc.dart';
import 'package:bloc_practice/Counter_part2/CounterPage.dart';
import 'package:bloc_practice/Cubit/counter_page.dart';
import 'package:bloc_practice/Cubit/like_image_page.dart';
import 'package:bloc_practice/Like_image/like_image_bloc.dart';
import 'package:bloc_practice/Like_image/like_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => LikeImageBloc(),
      child: MaterialApp(home: LikeImagePage()),
    ),
  );
}
