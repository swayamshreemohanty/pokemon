/// Represents the market data for a card.
class CardMarket {
  /// The URL of the card market.
  final String url;

  /// The date when the market data was last updated.
  final String updatedAt;

  /// The price details of the card market.
  final CardMarketPrice prices;

  /// Creates a new instance of [CardMarket].
  ///
  /// All parameters are required.
  CardMarket({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  /// Creates a new instance of [CardMarket] from a map.
  ///
  /// The [map] parameter must not be null and must contain the keys
  /// 'url', 'updatedAt', and 'prices'.
  factory CardMarket.fromMap(Map<String, dynamic> map) {
    return CardMarket(
      url: map['url'],
      updatedAt: map['updatedAt'],
      prices: CardMarketPrice.fromMap(map['prices']),
    );
  }
}

/// Represents the price details of a card market.
class CardMarketPrice {
  /// The average selling price of the card.
  final double averageSellPrice;

  /// The lowest price of the card.
  final double lowPrice;

  /// The trend price of the card.
  final double trendPrice;

  /// The lowest price of the card in the German market.
  final double germanProLow;

  /// The suggested price of the card.
  final double suggestedPrice;

  /// The selling price of the reverse holo card.
  final double reverseHoloSell;

  /// The lowest price of the reverse holo card.
  final double reverseHoloLow;

  /// The trend price of the reverse holo card.
  final double reverseHoloTrend;

  /// The lowest price of the card in excellent plus condition.
  final double lowPriceExPlus;

  /// The average price of the card over the last 1 day.
  final double avg1;

  /// The average price of the card over the last 7 days.
  final double avg7;

  /// The average price of the card over the last 30 days.
  final double avg30;

  /// The average price of the reverse holo card over the last 1 day.
  final double reverseHoloAvg1;

  /// The average price of the reverse holo card over the last 7 days.
  final double reverseHoloAvg7;

  /// The average price of the reverse holo card over the last 30 days.
  final double reverseHoloAvg30;

  /// Creates a new instance of [CardMarketPrice].
  ///
  /// All parameters are required.
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

  /// Creates a new instance of [CardMarketPrice] from a map.
  ///
  /// The [map] parameter must not be null and must contain the keys
  /// 'averageSellPrice', 'lowPrice', 'trendPrice', 'germanProLow',
  /// 'suggestedPrice', 'reverseHoloSell', 'reverseHoloLow', 'reverseHoloTrend',
  /// 'lowPriceExPlus', 'avg1', 'avg7', 'avg30', 'reverseHoloAvg1', 'reverseHoloAvg7',
  /// and 'reverseHoloAvg30'.
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
