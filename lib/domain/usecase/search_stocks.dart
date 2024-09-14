import 'package:stock_watchlist/domain/entities/stock_search_result.dart';
import 'package:stock_watchlist/domain/repositories/stock_search_repository.dart';

class SearchStocks {
  final StockSearchRepository repository;

  SearchStocks(this.repository);

  @override
  Future<List<StockSearchResult>> call(String params) async {
    return await repository.searchStocks(params);
  }
}
