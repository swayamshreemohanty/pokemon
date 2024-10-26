import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/pokemon_card/models/pokemon_card/pokemon_card_model.dart';

/// The widget that displays the Pokemon card.
class PokemonListGridWidget extends StatelessWidget {
  /// Constructs the [PokemonListGridWidget] widget.
  const PokemonListGridWidget({
    super.key,
    required this.pokemonCard,
  });

  /// The Pokemon card.
  final PokemonCard pokemonCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: pokemonCard.images.small,
              placeholder: (context, url) => const CircularProgressIndicator(),
              progressIndicatorBuilder: (context, url, progress) =>
                  CircularProgressIndicator(value: progress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              pokemonCard.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
