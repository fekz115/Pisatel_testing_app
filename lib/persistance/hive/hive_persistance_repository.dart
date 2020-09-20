import 'package:hive/hive.dart';
import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/domain/photo.dart';
import 'package:pisatel_testing_app/persistance/hive/comment_dto.dart';
import 'package:pisatel_testing_app/persistance/persistance_repository.dart';

class HivePersistanceRepository implements PersistanceRepository {
  final Box _box;

  HivePersistanceRepository(this._box);

  @override
  Future<Iterable<Comment>> getComments(int id) async {
    final cached = await _box.get(id);
    if (cached != null) {
      return (cached as Iterable<dynamic>)
          .cast<CommentDto>()
          .map((e) => e.entity)
          .toList();
    } else
      return null;
  }

  @override
  Future<void> saveComments(Photo photo, Iterable<Comment> comments) async {
    await _box.put(
        photo.id, comments.map((e) => CommentDto.fromEntity(e)).toList());
  }
}
