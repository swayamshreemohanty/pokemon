import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/base_route.dart';

/// The [GoRouterManager] class is responsible for managing the routing
class GoRouterManager {
  /// The route configuration.
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  /// The [GoRouter] instance.
  GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: "/",
    //extraCodec: const ScreenPayloadCodec(),
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "/",
        path: "/",
        builder: (context, state) => const BaseRoute(),
        routes: const [],
      ),
    ],
  );
}
