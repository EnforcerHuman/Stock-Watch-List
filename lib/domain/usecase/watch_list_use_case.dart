import 'package:stock_watchlist/data/models/watch_list_model.dart';
import 'package:stock_watchlist/domain/repositories/watch_list_repository.dart';

class WatchListUseCase {
  final WatchListRepository watchListRepositiory;

  WatchListUseCase(this.watchListRepositiory);
  Future<List<WatchListModel>> call(List<String> symbols) async {
    List<WatchListModel> data = [];
    try {
      for (var symbol in symbols) {
        Map<String, dynamic> test =
            await watchListRepositiory.fetchWatchListStocks(symbol);
        WatchListModel watchlist = WatchListModel.fromJson(test);
        data.add(watchlist);
      }

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
