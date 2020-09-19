import 'package:pisatel_testing_app/domain/photo.dart';

abstract class PhotoBlocEvent {}

class LoadPhotosEvent {}

class OpenPhotoCommentsEvent {
  final Photo photo;

  OpenPhotoCommentsEvent(this.photo);
}