abstract class LikeImageEvent {}

class ToggleLikeImage extends LikeImageEvent {
  final String imageUrl; // Định danh ảnh bằng URL hoặc ID
  ToggleLikeImage(this.imageUrl);
}
