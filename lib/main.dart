import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisatel_testing_app/bloc/comments/comment_bloc_state.dart';
import 'package:pisatel_testing_app/bloc/comments/comments_bloc.dart';
import 'package:pisatel_testing_app/bloc/photo/photo_bloc.dart';
import 'package:pisatel_testing_app/bloc/photo/photo_bloc_state.dart';
import 'package:pisatel_testing_app/repository/photo_api_service.dart';
import 'package:pisatel_testing_app/repository/photo_repository.dart';

import 'navigation.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = PhotoRepository(
      PhotoApiService.create(),
    );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PhotoBloc>(
            create: (context) => PhotoBloc(
              LoadingPhotosBlocState(),
              repository,
            ),
          ),
          BlocProvider<CommentsBloc>(
            create: (context) => CommentsBloc(
              LoadingPhotoCommentsState(null),
              repository,
            ),
          ),
        ],
        child: ExtendedNavigator<Router>(
          router: Router(),
          name: "mainNav",
        ),
      ),
    );
  }
}
