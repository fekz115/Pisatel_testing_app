// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PhotoApiService extends PhotoApiService {
  _$PhotoApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PhotoApiService;

  @override
  Future<Response<BuiltList<Photo>>> getPhotos() {
    final $url = '/albums/1/photos';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Photo>, Photo>($request);
  }

  @override
  Future<Response<BuiltList<Comment>>> getComments(int id) {
    final $url = '/posts/$id/comments';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Comment>, Comment>($request);
  }
}
