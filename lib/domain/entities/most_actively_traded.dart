class MostActivelyTradedEntity {
  final String ticker;
  final double price;
  final double changeAmount;
  final double changePercentage;
  final int volume;

  MostActivelyTradedEntity({
    required this.ticker,
    required this.price,
    required this.changeAmount,
    required this.changePercentage,
    required this.volume,
  });
}
