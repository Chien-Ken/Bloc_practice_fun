abstract class LikeImageState {}

class LikeImageInitial extends LikeImageState {}

class LikeImageUpdated extends LikeImageState {
  final Set<String> _likedImages;
  Set<String>get likedImages => _likedImages;
  LikeImageUpdated(this._likedImages);
}
