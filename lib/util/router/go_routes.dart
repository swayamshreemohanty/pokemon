import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/base_route.dart';
import 'package:pokemon/pokemon_card/screens/pokemon_cards_list_screen.dart';
import 'package:pokemon/util/router/animated_page_route.dart';

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
        routes: [
          ///PokemonCardsListScreen
          GoRoute(
            name: PokemonCardsListScreen.routeName,
            path: PokemonCardsListScreen.routeName,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                animatedPageRoute(
              pageKey: state.pageKey,
              navigationDirection: NavigationDirection.right,
              child: const PokemonCardsListScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
