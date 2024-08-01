import 'package:dioapi/routes/navigation.dart';
import 'package:dioapi/routes/navigation_data.dart';
import 'package:dioapi/views/detail.dart';
import 'package:dioapi/views/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  final GoRouter router =
      GoRouter(initialLocation: Navigation.homepage, routes: <GoRoute>[
    GoRoute(
        name: Navigation.homepage,
        path: Navigation.homepage,
        builder: (BuildContext context, GoRouterState state) {
          return MyHomePage();
        }),
    GoRoute(
        name: Navigation.detail,
        path: Navigation.detail,
        builder: (BuildContext context, GoRouterState state) {
          return Detail(
            data: state.extra as NavigationData,
          );
        }),
  ]);
}
