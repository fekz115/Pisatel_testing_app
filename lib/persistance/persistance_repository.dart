import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/domain/photo.dart';

abstract class PersistanceRepository {
  Future<Iterable<Comment>> getComments(int id);
  Future<void> saveComments(Photo photo, Iterable<Comment> comments);
}