import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisatel_testing_app/bloc/comments/comment_bloc_state.dart';
import 'package:pisatel_testing_app/bloc/comments/comments_bloc.dart';
import 'package:pisatel_testing_app/domain/comment.dart';
import 'package:pisatel_testing_app/domain/photo.dart';
import 'package:pisatel_testing_app/widget/comment.dart';

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo screen'),
      ),
      body: BlocBuilder<CommentsBloc, PhotoCommentsState>(
          builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildPhotoInfo(state.photo),
              _buildBottomPart(state),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildBottomPart(PhotoCommentsState state) {
    if (state is LoadingPhotoCommentsState) {
      return _buildLoadingScreen();
    } else if (state is LoadedPhotoCommentsState) {
      return _buildPhotoComments(state.comments);
    } else {
      if (state is ErrorPhotoCommentsState) {
        print(state.e);
      }
      return _buildErrorScreen();
    }
  }

  Widget _buildPhotoInfo(Photo photo) {
    return Stack(
      children: [
        Image.network(photo.url),
        Text(photo.title),
      ],
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorScreen() {
    return Center(
      child: Text('Something went wrong'),
    );
  }

  Widget _buildPhotoComments(Iterable<Comment> comments) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        ...comments.map((e) => CommentWidget(comment: e)).toList(),
      ],
    );
  }
}
