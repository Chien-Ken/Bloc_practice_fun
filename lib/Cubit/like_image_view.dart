import 'package:bloc_practice/Cubit/like_cubit.dart';
import 'package:bloc_practice/Cubit/list_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeImageView extends StatelessWidget {
   LikeImageView({super.key});
    final List<String> imageUrls = [
    'assets/images/hotel-1.jpg',
    'assets/images/hotel-2.jpg',
    'assets/images/hotel-3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListLike()),
        );
       } ,
        icon: Icon(Icons.arrow_back)),
      ),
      body: BlocBuilder<LikeCubit, Set<String>>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
            ),
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index) {
              final imageUrl = imageUrls[index];
              final isLiked = state.contains(imageUrl);
              return GestureDetector(
                onTap: () {
                    onTap: () => context.read<LikeCubit>().toggleLike(imageUrl);
                },
                child: Stack(
                  children: [
                     Image.asset(imageUrl, fit: BoxFit.cover),
                        Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                          size: 30,
                        ),
                  ],
                ),
              ) ;
            },
          );
        }),
    );
  }
}