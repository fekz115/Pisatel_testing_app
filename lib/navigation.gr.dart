// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'initial_screen.dart';
import 'navigation.dart';
import 'photo_screen.dart';

class Routes {
  static const String initialScreen = '/';
  static const String photoScreen = '/photo-screen';
  static const all = <String>{
    initialScreen,
    photoScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.initialScreen, page: InitialScreen),
    RouteDef(Routes.photoScreen, page: PhotoScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    InitialScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            InitialScreen(),
        settings: data,
        transitionsBuilder: zoomInTransition,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
    PhotoScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => PhotoScreen(),
        settings: data,
        transitionsBuilder: zoomInTransition,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
  };
}
