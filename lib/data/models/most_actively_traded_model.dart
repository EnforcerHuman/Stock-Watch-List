import 'package:stock_watchlist/domain/entities/most_actively_traded.dart';

class MostActivelyTradedModel extends MostActivelyTradedEntity {
  MostActivelyTradedModel({
    required String ticker,
    required double price,
    required double changeAmount,
    required double changePercentage,
    required int volume,
  }) : super(
          ticker: ticker,
          price: price,
          changeAmount: changeAmount,
          changePercentage: changePercentage,
          volume: volume,
        );

  factory MostActivelyTradedModel.fromJson(Map<String, dynamic> json) {
    return MostActivelyTradedModel(
      ticker: json["ticker"],
      price: double.parse(json["price"]),
      changeAmount: double.parse(json["change_amount"]),
      changePercentage:
          double.parse(json["change_percentage"].replaceAll('%', '')),
      volume: int.parse(json["volume"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ticker": ticker,
      "price": price.toString(),
      "change_amount": changeAmount.toString(),
      "change_percentage": "$changePercentage%",
      "volume": volume.toString(),
    };
  }

  // Optionally, you can add a method to convert the model to an entity
  MostActivelyTradedEntity toEntity() {
    return MostActivelyTradedEntity(
      ticker: ticker,
      price: price,
      changeAmount: changeAmount,
      changePercentage: changePercentage,
      volume: volume,
    );
  }

  @override
  String toString() {
    return 'MostActivelyTradedModel(ticker: $ticker, price: $price, '
        'changeAmount: $changeAmount, changePercentage: $changePercentage, '
        'volume: $volume)';
  }
}
