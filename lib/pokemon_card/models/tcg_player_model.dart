class TcgPlayer {
  final String url;
  final String updatedAt;
  final TCGPlayerPriceDetails priceDetails;

  TcgPlayer({
    required this.url,
    required this.updatedAt,
    required this.priceDetails,
  });

  // from map
  factory TcgPlayer.fromMap(Map<String, dynamic> map) {
    return TcgPlayer(
      url: map['url'],
      updatedAt: map['updatedAt'],
      priceDetails: TCGPlayerPriceDetails.fromMap(map['prices']),
    );
  }
}

class TCGPlayerPriceDetails {
  final TCGPlayerPriceModel? normal;
  final TCGPlayerPriceModel? holofoil;
  final TCGPlayerPriceModel? reverseHolofoil;

  TCGPlayerPriceDetails({
    required this.normal,
    required this.holofoil,
    required this.reverseHolofoil,
  });

  // from map
  factory TCGPlayerPriceDetails.fromMap(Map<String, dynamic> map) {
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
  }
}

class TCGPlayerPriceModel {
  final double low;
  final double mid;
  final double high;
  final double market;
  final double? directLow;

  TCGPlayerPriceModel({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    this.directLow,
  });

  // from map
  factory TCGPlayerPriceModel.fromMap(Map<String, dynamic> map) {
    return TCGPlayerPriceModel(
      low: map['low'],
      mid: map['mid'],
      high: map['high'],
      market: map['market'],
      directLow: map['directLow'],
    );
  }
}
