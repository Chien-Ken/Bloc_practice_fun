import 'package:bloc_practice/Like_image/like_event.dart';
import 'package:bloc_practice/Like_image/like_image_bloc.dart';
import 'package:bloc_practice/Like_image/like_state.dart';
import 'package:bloc_practice/Like_image/list_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeImageScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/hotel-1.jpg',
    'assets/images/hotel-2.jpg',
    'assets/images/hotel-3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Like Image BLoC'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LikedImagesScreen()),
                );
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: BlocBuilder<LikeImageBloc, LikeImageState>(
        builder: (context, state) {
          final state = context.watch<LikeImageBloc>().state; // lấy trạng thái của bloc
          // state là trạng thái hiện tại của bloc
          Set<String> likedImages = {};

          if (state is LikeImageUpdated) {
            likedImages = state.likedImages;
          }

          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              final imageUrl = imageUrls[index];
              final isLiked = likedImages.contains(imageUrl);

              return GestureDetector(
                onTap: () => context
                    .read<LikeImageBloc>()
                    .add(ToggleLikeImage(imageUrl)),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(imageUrl, fit: BoxFit.cover),
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
