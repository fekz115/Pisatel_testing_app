import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisatel_testing_app/bloc/comments/comment_bloc_event.dart';
import 'package:pisatel_testing_app/bloc/comments/comment_bloc_state.dart';
import 'package:pisatel_testing_app/domain/photo.dart';
import 'package:pisatel_testing_app/repository/photo_repository.dart';

typedef Stream<S> Dispatcher<E, S>(E event);

class CommentsBloc extends Bloc<PhotoCommentsEvent, PhotoCommentsState> {
  final PhotoRepository _repository;
  Photo photo;

  CommentsBloc(PhotoCommentsState initialState, this._repository)
      : super(initialState) {
    _dispatchersMap = {
      LoadPhotoCommentsEvent: (event) =>
          _onLoadingPhotoComments(event as LoadPhotoCommentsEvent),
    };
  }

  Map<Type, Dispatcher<PhotoCommentsEvent, PhotoCommentsState>> _dispatchersMap;

  @override
  Stream<PhotoCommentsState> mapEventToState(PhotoCommentsEvent event) async* {
    try {
      yield* _dispatchersMap[event.runtimeType].call(event);
    } catch (e) {
      yield (ErrorPhotoCommentsState(photo, e));
    }
  }

  Stream<PhotoCommentsState> _onLoadingPhotoComments(
      LoadPhotoCommentsEvent event) async* {
    photo = event.photo;
    yield (LoadingPhotoCommentsState(photo));
    var comments = await _repository.getComments(photo.id).first;
    yield (LoadedPhotoCommentsState(photo, comments));
  }
}
