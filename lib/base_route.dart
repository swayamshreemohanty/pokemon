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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/pokemon_hello.gif",
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(PokemonCardsListScreen.routeName);
                  },
                  child: const Text('Let\'s Go!'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
