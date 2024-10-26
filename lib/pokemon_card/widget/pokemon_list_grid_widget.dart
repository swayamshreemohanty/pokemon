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
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: pokemonCard.id,
              child: CachedNetworkImage(
                imageUrl: pokemonCard.images.small,
                progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(value: progress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    // reduced blurRadius to reduce the height of the shadow
                    blurRadius: 3,
                    // reduced offset to reduce the height of the shadow
                    offset: const Offset(0, 0.5),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                pokemonCard.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
