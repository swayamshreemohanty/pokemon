import 'package:pokemon/pokemon_card/models/pokemon_card/other_attributes.dart';

/// A class representing the details of a Pokémon card set.
///
/// The [SetDetails] class contains information about a specific set of Pokémon cards,
/// including its ID, name, series, printed total, total, legalities, PTCGO code, release date,
/// update date, and images.
class SetDetails {
  /// The unique identifier for the set.
  final String id;

  /// The name of the set.
  final String name;

  /// The series to which the set belongs.
  final String series;

  /// The total number of cards printed in the set.
  final int printedTotal;

  /// The total number of cards in the set.
  final int total;

  /// The legalities of the set.
  final Legalities legalities;

  /// The PTCGO (Pokémon Trading Card Game Online) code for the set.
  final String ptcgoCode;

  /// The release date of the set.
  final String releaseDate;

  /// The date when the set details were last updated.
  final String updatedAt;

  /// The images associated with the set.
  final ImagesModel images;

  /// Creates a new instance of [SetDetails].
  ///
  /// All parameters are required.
  SetDetails({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });

  /// Creates a new instance of [SetDetails] from a map.
  ///
  /// The [map] parameter must contain keys corresponding to the fields of [SetDetails].

  factory SetDetails.fromMap(Map<String, dynamic> map) {
    return SetDetails(
      id: map['id'],
      name: map['name'],
      series: map['series'],
      printedTotal: map['printedTotal'],
      total: map['total'],
      legalities: Legalities.fromMap(map['legalities']),
      ptcgoCode: map['ptcgoCode'],
      releaseDate: map['releaseDate'],
      updatedAt: map['updatedAt'],
      images: ImagesModel.fromMap(map['images']),
    );
  }
}
