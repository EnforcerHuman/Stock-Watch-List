import 'package:stock_watchlist/domain/entities/stock_search_result.dart';

class StockSearchResultModel extends StockSearchResult {
  StockSearchResultModel({
    required super.symbol,
    required super.name,
    required super.type,
    required super.region,
  });

  factory StockSearchResultModel.fromJson(Map<String, dynamic> json) {
    return StockSearchResultModel(
      symbol: json['1. symbol'],
      name: json['2. name'],
      type: json['3. type'],
      region: json['4. region'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '1. symbol': symbol,
      '2. name': name,
      '3. type': type,
      '4. region': region,
    };
  }
}
