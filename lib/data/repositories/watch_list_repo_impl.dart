import 'package:stock_watchlist/data/datasources/watch_list_data_source_impl.dart';
import 'package:stock_watchlist/domain/repositories/watch_list_repository.dart';

class WatchListRepositioryImpl implements WatchListRepository {
  final WatchListDataSourceImpl watchListDataSourceImpl;

  WatchListRepositioryImpl(this.watchListDataSourceImpl);

  @override
  Future<Map<String, dynamic>> fetchWatchListStocks(String symbol) {
    return watchListDataSourceImpl.fetchWatchListData(symbol);
  }
}
