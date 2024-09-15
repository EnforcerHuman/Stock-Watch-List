import 'package:stock_watchlist/core/network/api_client.dart';
import 'package:stock_watchlist/data/models/stock_search_result_model.dart';

/// Abstract class defining the contract for stock search remote data source
abstract class StockSearchRemoteDataSource {
  /// Searches for stocks based on the provided query
  ///
  /// Returns a list of [StockSearchResultModel] objects
  Future<List<StockSearchResultModel>> searchStocks(String query);
}

/// Implementation of [StockSearchRemoteDataSource]
class StockSearchRemoteDataSourceImpl implements StockSearchRemoteDataSource {
  final ApiClients apiClient;

  StockSearchRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<StockSearchResultModel>> searchStocks(String query) async {
    // Make API call to search for stocks
    final response = await apiClient.get('', {
      'function': 'SYMBOL_SEARCH',
      'keywords': query,
    });

    // Parse and return the search results
    if (response['bestMatches'] != null) {
      return (response['bestMatches'] as List)
          .map((item) => StockSearchResultModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Search results not found in the response');
    }
  }
}
