import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/pokemon_card/models/pokemon_card/pokemon_card_model.dart';

///Pokemon card details widget.
///
/// This widget displays the details of a Pokemon card.
class PokemonCardDetailsWidget extends StatelessWidget {
  /// The Pokemon card.
  final PokemonCard pokemonCard;

  /// Constructs the [PokemonCardDetailsWidget] widget.
  const PokemonCardDetailsWidget({super.key, required this.pokemonCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          //image
          Hero(
            tag: pokemonCard.id,
            child: CachedNetworkImage(
              imageUrl: pokemonCard.images.large,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 8),
          //name
          Text(
            pokemonCard.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          //Set
          Text(
            'Set: ${pokemonCard.setDetails.name}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          //Type
          Text(
            'Type: ${pokemonCard.types.join(', ')}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          //Weakness
          Text(
            'Weakness: ${pokemonCard.weaknesses.join(', ')}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          //Artist
          Text(
            'Artist: ${pokemonCard.artist}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
