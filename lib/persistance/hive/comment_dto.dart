import 'package:hive/hive.dart';
import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/persistance/hive/hive_types.dart';

part 'comment_dto.g.dart';

@HiveType(typeId: HiveTypeIds.commentId)
class CommentDto {
  @HiveField(0)
  final int postId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String body;

  CommentDto({this.postId, this.id, this.name, this.email, this.body});

  Comment get entity => Comment((b) => {
        b
          ..id = id
          ..name = name
          ..email = email
          ..body = body
      });

  factory CommentDto.fromEntity(Comment entity) {
    return CommentDto(
      id: entity.id,
      body: entity.body,
      email: entity.email,
      name: entity.name,
      postId: entity.postId,
    );
  }
}
