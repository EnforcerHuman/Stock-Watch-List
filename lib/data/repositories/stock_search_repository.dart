import 'package:stock_watchlist/data/datasources/stock_search_data_source.dart';
import 'package:stock_watchlist/domain/entities/stock_search_result.dart';
import 'package:stock_watchlist/domain/repositories/stock_search_repository.dart';

class StockSearchRepositoryImpl implements StockSearchRepository {
  final StockSearchRemoteDataSource remoteDataSource;

  StockSearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<StockSearchResult>> searchStocks(String query) async {
    try {
      final results = await remoteDataSource.searchStocks(query);
      return results;
    } catch (e) {
      throw Exception('Failed to search stocks: $e');
    }
  }
}
