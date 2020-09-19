import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pisatel_testing_app/domain/serializers.dart';

part 'comment.g.dart';

abstract class Comment implements Built<Comment, CommentBuilder> {
  int get postId;
  int get id;
  String get name;
  String get email;
  String get body;

  Comment._();
  factory Comment([updates(CommentBuilder b)]) = _$Comment;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Comment.serializer, this));
  }

  static Comment fromJson(String jsonString) {
    return serializers.deserializeWith(
        Comment.serializer, json.decode(jsonString));
  }

  static Serializer<Comment> get serializer => _$commentSerializer;
}
