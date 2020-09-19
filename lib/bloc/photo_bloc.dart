import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisatel_testing_app/bloc/photo_bloc_event.dart';
import 'package:pisatel_testing_app/bloc/photo_bloc_state.dart';
import 'package:pisatel_testing_app/domain/photo.dart';
import 'package:pisatel_testing_app/repository/photo_repository.dart';

typedef Stream<S> Dispatcher<E, S>(E event);

class PhotoBloc extends Bloc<PhotoBlocEvent, PhotoBlocState> {
  final PhotoRepository _repository;
  BuiltList<Photo> photos;

  PhotoBloc(PhotoBlocState initialState, this._repository)
      : super(initialState) {
    _dispatchersMap = {
      LoadPhotosEvent: (event) => _onLoadingPhotos(event as LoadPhotosEvent),
      OpenPhotoCommentsEvent: (event) =>
          _onOpenPhotoComments(event as OpenPhotoCommentsEvent)
    };
    add(LoadPhotosEvent());
  }

  Map<Type, Dispatcher<PhotoBlocEvent, PhotoBlocState>> _dispatchersMap;

  @override
  Stream<PhotoBlocState> mapEventToState(PhotoBlocEvent event) async* {
    try {
      yield* _dispatchersMap[event.runtimeType].call(event);
    } catch (e) {
      yield (ErrorPhotoBlocState(e));
    }
  }

  Stream<PhotoBlocState> _onLoadingPhotos(LoadPhotosEvent event) async* {
    if (photos == null) {
      yield (LoadingPhotosBlocState());
      photos = await _repository.getPhotos().first;
    } 
    yield (LoadedPhotosBlocState(photos));
  }

  Stream<PhotoBlocState> _onOpenPhotoComments(
      OpenPhotoCommentsEvent event) async* {
    yield (LoadingPhotoCommentsBlocState(event.photo));
    var comments = await _repository.getComments(event.photo.id).first;
    yield (LoadedPhotoCommentsBlocState(event.photo, comments));
  }
}
