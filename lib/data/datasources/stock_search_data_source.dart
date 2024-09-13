import 'package:stock_watchlist/core/network/api_client.dart';
import 'package:stock_watchlist/data/models/stock_search_result_model.dart';

abstract class StockSearchRemoteDataSource {
  Future<List<StockSearchResultModel>> searchStocks(String query);
}

class StockSearchRemoteDataSourceImpl implements StockSearchRemoteDataSource {
  final ApiClients apiClient;

  StockSearchRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<StockSearchResultModel>> searchStocks(String query) async {
    final response = await apiClient.get('', {
      'function': 'SYMBOL_SEARCH',
      'keywords': query,
    });

    if (response['bestMatches'] != null) {
      return (response['bestMatches'] as List)
          .map((item) => StockSearchResultModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Search results not found in the response');
    }
  }
}
