class CardMarket {
  final String url;
  final String updatedAt;
  final CardMarketPrice prices;

  CardMarket({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  // from map
  factory CardMarket.fromMap(Map<String, dynamic> map) {
    return CardMarket(
      url: map['url'],
      updatedAt: map['updatedAt'],
      prices: CardMarketPrice.fromMap(map['prices']),
    );
  }
}

class CardMarketPrice {
  final double averageSellPrice;
  final double lowPrice;
  final double trendPrice;
  final double germanProLow;
  final double suggestedPrice;
  final double reverseHoloSell;
  final double reverseHoloLow;
  final double reverseHoloTrend;
  final double lowPriceExPlus;
  final double avg1;
  final double avg7;
  final double avg30;
  final double reverseHoloAvg1;
  final double reverseHoloAvg7;
  final double reverseHoloAvg30;

  CardMarketPrice({
    required this.averageSellPrice,
    required this.lowPrice,
    required this.trendPrice,
    required this.germanProLow,
    required this.suggestedPrice,
    required this.reverseHoloSell,
    required this.reverseHoloLow,
    required this.reverseHoloTrend,
    required this.lowPriceExPlus,
    required this.avg1,
    required this.avg7,
    required this.avg30,
    required this.reverseHoloAvg1,
    required this.reverseHoloAvg7,
    required this.reverseHoloAvg30,
  });

  // from map
  factory CardMarketPrice.fromMap(Map<String, dynamic> map) {
    return CardMarketPrice(
      averageSellPrice: map['averageSellPrice'],
      lowPrice: map['lowPrice'],
      trendPrice: map['trendPrice'],
      germanProLow: map['germanProLow'],
      suggestedPrice: map['suggestedPrice'],
      reverseHoloSell: map['reverseHoloSell'],
      reverseHoloLow: map['reverseHoloLow'],
      reverseHoloTrend: map['reverseHoloTrend'],
      lowPriceExPlus: map['lowPriceExPlus'],
      avg1: map['avg1'],
      avg7: map['avg7'],
      avg30: map['avg30'],
      reverseHoloAvg1: map['reverseHoloAvg1'],
      reverseHoloAvg7: map['reverseHoloAvg7'],
      reverseHoloAvg30: map['reverseHoloAvg30'],
    );
  }
}
