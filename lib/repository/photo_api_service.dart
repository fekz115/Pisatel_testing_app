import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/domain/photo.dart';
import 'package:chopper_built_value/chopper_built_value.dart';
import 'package:pisatel_testing_app/domain/serializers.dart';

part 'photo_api_service.chopper.dart';

@ChopperApi()
abstract class PhotoApiService extends ChopperService {

  @Get(path: '/albums/1/photos')
  Future<Response<BuiltList<Photo>>> getPhotos();

  @Get(path: '/posts/{id}/comments')
  Future<Response<BuiltList<Comment>>> getComments(@Path('id') int id);

  static PhotoApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PhotoApiService(),
      ],
      converter: BuiltValueConverter(serializers),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$PhotoApiService(client);
  }
}