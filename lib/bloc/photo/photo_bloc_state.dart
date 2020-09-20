import 'package:built_collection/built_collection.dart';
import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/domain/photo.dart';

abstract class PhotoBlocState {}

class LoadingPhotosBlocState implements PhotoBlocState {}

class LoadingPhotoCommentsBlocState implements PhotoBlocState {
  final Photo photo;

  LoadingPhotoCommentsBlocState(this.photo);
}

class LoadedPhotosBlocState implements PhotoBlocState {
  final BuiltList<Photo> photos;

  LoadedPhotosBlocState(this.photos);
}

class LoadedPhotoCommentsBlocState implements PhotoBlocState {
  final Photo photo;
  final BuiltList<Comment> comments;

  LoadedPhotoCommentsBlocState(this.photo, this.comments);
}

class ErrorPhotoBlocState implements PhotoBlocState {
  final Exception e;

  ErrorPhotoBlocState(this.e);
}