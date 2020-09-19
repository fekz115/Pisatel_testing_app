import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/domain/photo.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Comment,
  Photo,
])
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();