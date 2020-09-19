import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisatel_testing_app/widget/photo.dart';

import 'bloc/photo_bloc.dart';
import 'bloc/photo_bloc_event.dart';
import 'bloc/photo_bloc_state.dart';
import 'domain/photo.dart';
import 'navigation.gr.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Initial screen'),
      ),
      body: BlocConsumer<PhotoBloc, PhotoBlocState>(
        listener: (context, state) {
          if (state is LoadingPhotoCommentsBlocState) {
            ExtendedNavigator.root.push(Routes.photoScreen);
          }
        },
        buildWhen: (prev, next) => [
          LoadingPhotosBlocState,
          LoadedPhotosBlocState,
          ErrorPhotoBlocState,
        ].contains(next.runtimeType),
        builder: (context, state) {
          if (state is LoadingPhotosBlocState) {
            return _buildLoadingScreen();
          } else if (state is LoadedPhotosBlocState) {
            return _buildPhotosList(state.photos, context);
          } else {
            if (state is ErrorPhotoBlocState) {
              print(state.e);
            }
            return _buildErrorScreen();
          }
        },
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildPhotosList(Iterable<Photo> photos, BuildContext context) {
    return ListView(
      children: [
        ...photos
            .map((e) => PhotoWidget(
                  e,
                  onPhotoTap: (photo) {
                    BlocProvider.of<PhotoBloc>(context)
                        .add(OpenPhotoCommentsEvent(photo));
                  },
                ))
            .toList()
      ],
    );
  }

  Widget _buildErrorScreen() {
    return Center(
      child: Text('Something went wrong'),
    );
  }
}
