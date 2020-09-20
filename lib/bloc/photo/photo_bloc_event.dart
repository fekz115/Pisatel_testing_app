import 'package:pisatel_testing_app/domain/photo.dart';

abstract class PhotoBlocEvent {}

class LoadPhotosEvent implements PhotoBlocEvent {}

class OpenPhotoCommentsEvent implements PhotoBlocEvent {
  final Photo photo;

  OpenPhotoCommentsEvent(this.photo);
}