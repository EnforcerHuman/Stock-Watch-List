abstract class WatchListRepository {
  Future<Map<String, dynamic>> fetchWatchListStocks(String symbol);
}
