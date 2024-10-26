/// Represents a TCGPlayer with URL, update time, and price details.
class TcgPlayer {
  /// The URL of the TCGPlayer.
  final String url;

  /// The last update time of the TCGPlayer.
  final String updatedAt;

  /// The price details of the TCGPlayer.
  final TCGPlayerPriceDetails priceDetails;

  /// Creates a new instance of [TcgPlayer].
  TcgPlayer({
    required this.url,
    required this.updatedAt,
    required this.priceDetails,
  });

  /// Creates a new instance of [TcgPlayer] from a map.
  ///
  /// [map] is a map containing the TCGPlayer data.
  factory TcgPlayer.fromMap(Map<String, dynamic> map) {
    return TcgPlayer(
      url: map['url'],
      updatedAt: map['updatedAt'],
      priceDetails: TCGPlayerPriceDetails.fromMap(map['prices']),
    );
  }
}

/// Represents the price details of a TCGPlayer.
class TCGPlayerPriceDetails {
  /// The normal price model.
  final TCGPlayerPriceModel? normal;

  /// The holofoil price model.
  final TCGPlayerPriceModel? holofoil;

  /// The reverse holofoil price model.
  final TCGPlayerPriceModel? reverseHolofoil;

  /// Creates a new instance of [TCGPlayerPriceDetails].
  TCGPlayerPriceDetails({
    required this.normal,
    required this.holofoil,
    required this.reverseHolofoil,
  });

  /// Creates a new instance of [TCGPlayerPriceDetails] from a map.
  ///
  /// [map] is a map containing the price details data.
  factory TCGPlayerPriceDetails.fromMap(Map<String, dynamic> map) {
    try {
      return TCGPlayerPriceDetails(
        normal: map['normal'] == null
            ? null
            : TCGPlayerPriceModel.fromMap(map['normal']),
        holofoil: map['holofoil'] == null
            ? null
            : TCGPlayerPriceModel.fromMap(map['holofoil']),
        reverseHolofoil: map['reverseHolofoil'] == null
            ? null
            : TCGPlayerPriceModel.fromMap(map['reverseHolofoil']),
      );
    } catch (e) {
      throw Exception('Failed to create TCGPlayerPriceDetails: $e');
    }
  }
}

/// Represents a price model for a TCGPlayer.
class TCGPlayerPriceModel {
  /// The low price.
  final double low;

  /// The mid price.
  final double mid;

  /// The high price.
  final double high;

  /// The market price.
  final double market;

  /// The direct low price, if available.
  final double? directLow;

  /// Creates a new instance of [TCGPlayerPriceModel].
  TCGPlayerPriceModel({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    this.directLow,
  });

  /// Creates a new instance of [TCGPlayerPriceModel] from a map.
  ///
  /// [map] is a map containing the price model data.
  factory TCGPlayerPriceModel.fromMap(Map<String, dynamic> map) {
    try {
      return TCGPlayerPriceModel(
        low: map['low'],
        mid: map['mid'],
        high: map['high'],
        market: map['market'],
        directLow: map['directLow'],
      );
    } catch (e) {
      throw Exception('Failed to create TCGPlayerPriceModel: $e');
    }
  }
}
