import 'package:pokemon/pokemon_card/models/card_market_model.dart';
import 'package:pokemon/pokemon_card/models/set_details_models.dart';
import 'package:pokemon/pokemon_card/models/tcg_player_model.dart';
import 'other_attributes.dart';

class PokemonCard {
  final String id;
  final String name;
  final String supertype;
  final List<String> subtypes;
  final String? level;
  final String hp;
  final List<String> types;
  final String? evolvesFrom;
  final List<Ability> abilities;
  final List<Attack> attacks;
  final List<Weakness> weaknesses;
  final List<Resistance> resistances;
  final List<String> retreatCost;
  final int convertedRetreatCost;
  final SetDetails setDetails;
  final String number;
  final String artist;
  final String rarity;
  final String? flavorText;
  final List<int> nationalPokedexNumbers;
  final Legalities legalities;
  final ImagesModel images;
  final TcgPlayer tcgplayer;
  final CardMarket cardmarket;

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

  // from map
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
      images: ImagesModel.fromMap(map['images']),
      tcgplayer: TcgPlayer.fromMap(map['tcgplayer']),
      cardmarket: CardMarket.fromMap(map['cardmarket']),
    );
  }
}
