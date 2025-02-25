import 'package:bloc_practice/Cubit/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListLike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final likedImages = context.watch<LikeCubit>().state.toList();

    return Scaffold(
      appBar: AppBar(title: Text('Liked Images')),
      body: likedImages.isEmpty
          ? Center(child: Text('No liked images yet!'))
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: likedImages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(likedImages[index], width: 50),
                  title: Text('Image $index'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<LikeCubit>().toggleLike(likedImages[index]);
                    },
                  ),
                );
              },
            ),
    );
  }
}
