import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:pisatel_testing_app/initial_screen.dart';
import 'package:pisatel_testing_app/photo_screen.dart';

@CustomAutoRouter(
  routes: [
    CustomRoute(
      page: InitialScreen,
      initial: true,
      transitionsBuilder: zoomInTransition,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: PhotoScreen,
      transitionsBuilder: zoomInTransition,
      durationInMilliseconds: 400,
    ),
  ]
)
class $Router {}

Widget zoomInTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return ZoomPageTransitionsBuilder().buildTransitions(null, context, animation, secondaryAnimation, child);
}