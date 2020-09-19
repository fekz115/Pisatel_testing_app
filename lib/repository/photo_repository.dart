import 'package:built_collection/built_collection.dart';
import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/domain/photo.dart';
import 'package:pisatel_testing_app/repository/photo_api_service.dart';

class PhotoRepository {
  final PhotoApiService _apiService;

  PhotoRepository(this._apiService);

  Stream<BuiltList<Photo>> getPhotos() {
    return Stream.fromFuture(_apiService.getPhotos().then((value) => value.body));
  }

  Stream<BuiltList<Comment>> getComments(int id) {
    return Stream.fromFuture(_apiService.getComments(id).then((value) => value.body));
  }

}