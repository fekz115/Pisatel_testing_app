import 'package:built_collection/built_collection.dart';
import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/domain/photo.dart';

abstract class PhotoCommentsState {
  Photo get photo;
}

class LoadingPhotoCommentsState extends PhotoCommentsState {
  final Photo photo;
  LoadingPhotoCommentsState(this.photo);
}

class LoadedPhotoCommentsState extends PhotoCommentsState {
  final Photo photo;
  final BuiltList<Comment> comments;

  LoadedPhotoCommentsState(this.photo, this.comments);
}

class ErrorPhotoCommentsState extends PhotoCommentsState {
  final Photo photo;
  final Exception e;

  ErrorPhotoCommentsState(this.photo, this.e);
}