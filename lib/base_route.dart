import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/pokemon_card/screens/pokemon_cards_list_screen.dart';

/// The base route of the application.
class BaseRoute extends StatelessWidget {
  /// Constructs the [BaseRoute] widget.
  const BaseRoute({super.key});

  /// The route name.
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Cards App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CachedNetworkImage(
          //   imageUrl:
          //       "https://tenor.com/view/hi-hello-hiya-howdy-good-morning-gif-7599730966006624111",
          //   placeholder: (context, url) => const CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          // ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context)
                    .pushNamed(PokemonCardsListScreen.routeName);
              },
              child: const Text('Pokemon Cards List'),
            ),
          ),
        ],
      ),
    );
  }
}
