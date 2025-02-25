import 'package:flutter_bloc/flutter_bloc.dart';

class LikeCubit extends Cubit<Set<String>> {
  LikeCubit() : super({});

  void toggleLike(String imageUrl) {
    final updateLikes = Set<String>.from(state);
    if(updateLikes.contains(imageUrl)) {
      updateLikes.remove(imageUrl);
    }else{
      updateLikes.add(imageUrl);
    }
    emit(updateLikes);
  }
  

}