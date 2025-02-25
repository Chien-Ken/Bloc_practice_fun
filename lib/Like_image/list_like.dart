import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'like_image_bloc.dart';
import 'like_state.dart';

class LikedImagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liked Images")),
      body: BlocBuilder<LikeImageBloc, LikeImageState>(
        builder: (context, state) {
          // Lấy danh sách ảnh đã like
          Set<String> likedImages = {};
          if (state is LikeImageUpdated) {
            likedImages = state.likedImages;
          }

          // Nếu không có ảnh nào được like
          if (likedImages.isEmpty) {
            return Center(child: Text("Chưa có ảnh nào được thích!"));
          }

          // Hiển thị danh sách ảnh đã like
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: likedImages.length,
            itemBuilder: (context, index) {
              final imageUrl = likedImages.elementAt(index);
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(imageUrl, fit: BoxFit.cover),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
