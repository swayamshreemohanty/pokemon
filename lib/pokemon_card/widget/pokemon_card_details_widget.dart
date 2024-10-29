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
          CachedNetworkImage(
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
          const SizedBox(height: 8),
          //name
          Text(
            pokemonCard.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),

          //Ability
          if (pokemonCard.abilities.isNotEmpty)
            PokemonDetailsTextWidget(
              leftText: 'Ability: ',
              rightText: pokemonCard.abilities.map((e) => e.name).join(', '),
            ),

          // Attacks
          if (pokemonCard.attacks.isNotEmpty)
            PokemonDetailsTextWidget(
              leftText: 'Attacks: ',
              rightText: pokemonCard.attacks.map((e) => e.name).join(', '),
            ),

          //Set
          PokemonDetailsTextWidget(
            leftText: 'Set: ',
            rightText: pokemonCard.setDetails.name,
          ),

          //Type
          if (pokemonCard.types.isNotEmpty)
            PokemonDetailsTextWidget(
              leftText: 'Type: ',
              rightText: pokemonCard.types.join(', '),
            ),

          //Weakness
          if (pokemonCard.weaknesses.isNotEmpty)
            PokemonDetailsTextWidget(
              leftText: 'Weakness: ',
              rightText: pokemonCard.weaknesses.map((e) => e.value).join(', '),
            ),

          //Artist
          PokemonDetailsTextWidget(
            leftText: 'Artist: ',
            rightText: pokemonCard.artist,
          ),
        ],
      ),
    );
  }
}

///Pokemon details text widget.
class PokemonDetailsTextWidget extends StatelessWidget {
  /// The left text.
  final String leftText;

  /// The right text.
  final String rightText;

  /// Constructs the [PokemonDetailsTextWidget] widget.
  const PokemonDetailsTextWidget({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            leftText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              rightText,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
