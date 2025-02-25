import 'package:bloc_practice/Like_image/like_event.dart';
import 'package:bloc_practice/Like_image/like_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeImageBloc extends Bloc<LikeImageEvent, LikeImageState> {
  final Set<String> _likedImages = {}; // Dữ liệu nội bộ
  
  LikeImageBloc() : super(LikeImageInitial()) {
    on<ToggleLikeImage>((event, emit) {
      if (_likedImages.contains(event.imageUrl)) {
        _likedImages.remove(event.imageUrl);
      } else {
        _likedImages.add(event.imageUrl);
      }
      emit(LikeImageUpdated(Set.from(_likedImages))); // Cập nhật trạng thái
    });
  }

  // Bloc đã sử dụng even để làm object, còn dùng state để lưu giữ trạng thái.
  

  // ✅ Getter để lấy danh sách ảnh đã like
  Set<String> get likedImages => _likedImages;
}