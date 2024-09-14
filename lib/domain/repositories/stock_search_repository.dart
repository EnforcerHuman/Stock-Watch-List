import 'package:stock_watchlist/domain/entities/stock_search_result.dart';

abstract class StockSearchRepository {
  Future<List<StockSearchResult>> searchStocks(String query);
}
