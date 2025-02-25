import 'package:bloc_practice/Cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Text(state.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            );
        }),
        floatingActionButton: Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increasement();
              },
              child: Icon(Icons.add),
              ),
              SizedBox(height: 10,),              
              FloatingActionButton(
               onPressed: () {                
                context.read<CounterCubit>().decreasement();
              },
              child: Icon(Icons.remove),
              ),
              FloatingActionButton(
               onPressed: () {
                context.read<CounterCubit>().reset();
              },
              child: Icon(Icons.reset_tv),
              ),
          ],
        ),
    );
  }
}