import 'package:pokemon/pokemon_card/models/pokemon_card/card_market_model.dart';
import 'package:pokemon/pokemon_card/models/pokemon_card/other_attributes.dart';
import 'package:pokemon/pokemon_card/models/pokemon_card/set_details_models.dart';
import 'package:pokemon/pokemon_card/models/pokemon_card/tcg_player_model.dart';

/// Represents a Pokemon card with various attributes and details.
class PokemonCard {
  /// The unique identifier of the Pokemon card.
  final String id;

  /// The name of the Pokemon card.
  final String name;

  /// The supertype of the Pokemon card.
  final String supertype;

  /// The subtypes of the Pokemon card.
  final List<String> subtypes;

  /// The level of the Pokemon card, if available.
  final String? level;

  /// The hit points (HP) of the Pokemon card.
  final String hp;

  /// The types of the Pokemon card.
  final List<String> types;

  /// The name of the Pokemon from which this card evolves, if available.
  final String? evolvesFrom;

  /// The abilities of the Pokemon card.
  final List<Ability> abilities;

  /// The attacks of the Pokemon card.
  final List<Attack> attacks;

  /// The weaknesses of the Pokemon card.
  final List<Weakness> weaknesses;

  /// The resistances of the Pokemon card.
  final List<Resistance> resistances;

  /// The retreat cost of the Pokemon card.
  final List<String> retreatCost;

  /// The converted retreat cost of the Pokemon card.
  final int convertedRetreatCost;

  /// The set details of the Pokemon card.
  final SetDetails setDetails;

  /// The number of the Pokemon card in the set.
  final String number;

  /// The artist who illustrated the Pokemon card.
  final String artist;

  /// The rarity of the Pokemon card.
  final String rarity;

  /// The flavor text of the Pokemon card, if available.
  final String? flavorText;

  /// The national Pokedex numbers associated with the Pokemon card.
  final List<int> nationalPokedexNumbers;

  /// The legalities of the Pokemon card in various formats.
  final Legalities legalities;

  /// The images associated with the Pokemon card.
  final PokemonImage images;

  /// The TCGPlayer details of the Pokemon card.
  final TcgPlayer tcgplayer;

  /// The CardMarket details of the Pokemon card.
  final CardMarket cardmarket;

  /// Creates a new instance of [PokemonCard].
  ///
  /// All parameters are required unless otherwise specified.
  PokemonCard({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.level,
    required this.hp,
    required this.types,
    required this.evolvesFrom,
    required this.abilities,
    required this.attacks,
    required this.weaknesses,
    required this.resistances,
    required this.retreatCost,
    required this.convertedRetreatCost,
    required this.setDetails,
    required this.number,
    required this.artist,
    required this.rarity,
    required this.flavorText,
    required this.nationalPokedexNumbers,
    required this.legalities,
    required this.images,
    required this.tcgplayer,
    required this.cardmarket,
  });

  /// Creates a new instance of [PokemonCard] from a map.
  ///
  /// The [map] parameter must contain all the necessary keys and values
  /// to properly initialize a [PokemonCard] instance.
  factory PokemonCard.fromMap(Map<String, dynamic> map) {
    return PokemonCard(
      id: map['id'],
      name: map['name'],
      supertype: map['supertype'],
      subtypes: List<String>.from(map['subtypes']),
      level: map['level'],
      hp: map['hp'],
      types: List<String>.from(map['types']),
      evolvesFrom: map['evolvesFrom'],
      abilities: List<Ability>.from(
        map['abilities'].map(
          (item) => Ability.fromMap(item),
        ),
      ),
      attacks: List<Attack>.from(
        map['attacks'].map(
          (item) => Attack.fromMap(item),
        ),
      ),
      weaknesses: List<Weakness>.from(
        map['weaknesses'].map(
          (item) => Weakness.fromMap(item),
        ),
      ),
      resistances: List<Resistance>.from(
        map['resistances'].map(
          (item) => Resistance.fromMap(item),
        ),
      ),
      retreatCost: List<String>.from(map['retreatCost']),
      convertedRetreatCost: map['convertedRetreatCost'],
      setDetails: SetDetails.fromMap(map['set']),
      number: map['number'],
      artist: map['artist'],
      rarity: map['rarity'],
      flavorText: map['flavorText'],
      nationalPokedexNumbers: List<int>.from(map['nationalPokedexNumbers']),
      legalities: Legalities.fromMap(map['legalities']),
      images: PokemonImage.fromMap(map['images']),
      tcgplayer: TcgPlayer.fromMap(map['tcgplayer']),
      cardmarket: CardMarket.fromMap(map['cardmarket']),
    );
  }
}

/// Represents images associated with a Pokémon card.
class PokemonImage {
  /// The small image URL.
  final String small;

  /// The large image URL.
  final String large;

  /// Creates an instance of [PokemonImage].
  ///
  /// [small] is the small image URL.
  /// [large] is the large image URL.
  PokemonImage({
    required this.small,
    required this.large,
  });

  /// Creates an instance of [PokemonImage] from a map.
  ///
  /// [map] is a map containing the images data.
  factory PokemonImage.fromMap(Map<String, dynamic> map) {
    return PokemonImage(
      small: map['small'],
      large: map['large'],
    );
  }
}
