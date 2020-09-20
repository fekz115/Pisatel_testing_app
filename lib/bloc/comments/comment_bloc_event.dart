import 'package:pisatel_testing_app/domain/photo.dart';

abstract class PhotoCommentsEvent {}

class LoadPhotoCommentsEvent implements PhotoCommentsEvent {
  final Photo photo;

  LoadPhotoCommentsEvent(this.photo);
}