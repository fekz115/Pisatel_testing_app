import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pisatel_testing_app/domain/serializers.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  int get albumId;
  int get id;
  String get title;
  String get url;
  String get thumbnailUrl;

  Photo._();
  factory Photo([updates(PhotoBuilder b)]) = _$Photo;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Photo.serializer, this));
  }

  static Photo fromJson(String jsonString) {
    return serializers.deserializeWith(
        Photo.serializer, json.decode(jsonString));
  }

  static Serializer<Photo> get serializer => _$photoSerializer;

}
