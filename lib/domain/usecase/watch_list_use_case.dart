import 'package:stock_watchlist/data/models/wacth_list_item_model.dart';
import 'package:stock_watchlist/data/models/watch_list_model.dart';
import 'package:stock_watchlist/data/repositories/local_storage_repo_impl.dart';
import 'package:stock_watchlist/domain/repositories/watch_list_repository.dart';

class WatchListUseCase {
  final WatchListRepository watchListRepositiory;

  WatchListUseCase(this.watchListRepositiory);
  LocalStorageRepoImpl localStorageRepoImpl = LocalStorageRepoImpl();

  Future<List<WatchListModel>> call(List<String> symbolss) async {
    List<WatchListModel> data = [];
    List<String> symbols = [];
    List<WacthListItemModel> test =
        await localStorageRepoImpl.getAllWatchListItems();
    for (var stock in test) {
      symbols.add(stock.stockName);
    }
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

  Future<void> addWatchListItem(String name) async {
    localStorageRepoImpl.insertItem(name);
  }

  Future<void> deleteWatchListItem(int id) async {
    await localStorageRepoImpl.deleteWatchListItem(id);
  }
}
