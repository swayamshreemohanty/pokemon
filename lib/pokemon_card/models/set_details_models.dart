import 'package:pokemon/pokemon_card/models/other_attributes.dart';

class SetDetails {
  final String id;
  final String name;
  final String series;
  final int printedTotal;
  final int total;
  final Legalities legalities;
  final String ptcgoCode;
  final String releaseDate;
  final String updatedAt;
  final ImagesModel images;

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

  // from map
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
