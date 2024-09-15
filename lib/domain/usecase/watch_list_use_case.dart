import 'package:stock_watchlist/data/models/wacth_list_item_model.dart';
import 'package:stock_watchlist/data/models/watch_list_model.dart';
import 'package:stock_watchlist/data/repositories/local_storage_repo_impl.dart';
import 'package:stock_watchlist/domain/repositories/watch_list_repository.dart';

class WatchListUseCase {
  final WatchListRepository watchListRepositiory;

  WatchListUseCase(this.watchListRepositiory);
  LocalStorageRepoImpl localStorageRepoImpl = LocalStorageRepoImpl();

  // Future<List<WatchListModel>> call() async {
  //   List<WatchListModel> data = [];
  //   List<String> watchList = [];

  //   try {
  //     List<WacthListItemModel> localItems =
  //         await localStorageRepoImpl.getAllWatchListItems();
  //     watchList = localItems.map((item) => item.stockName).toList();

  //     if (watchList.isEmpty) {
  //       print("No items found in the local database.");
  //       return data;
  //     }

  //     for (var symbol in watchList) {
  //       try {
  //         Map<String, dynamic> stockData =
  //             await watchListRepositiory.fetchWatchListStocks(symbol);
  //         WatchListModel watchlist = WatchListModel.fromJson(stockData);
  //         data.add(watchlist);
  //       } catch (e) {
  //         print('Error fetching data for $symbol: $e');
  //       }
  //     }
  //   } catch (e) {
  //     print('Error in call() method: $e');
  //   }

  //   print("Data from watchList: $data");
  //   return data;
  // }
  Stream<WatchListModel> call() async* {
    try {
      List<WacthListItemModel> localItems =
          await localStorageRepoImpl.getAllWatchListItems();
      List<String> watchList =
          localItems.map((item) => item.stockName).toList();

      if (watchList.isEmpty) {
        print("No items found in the local database.");
        return;
      }

      for (var symbol in watchList) {
        try {
          Map<String, dynamic> stockData =
              await watchListRepositiory.fetchWatchListStocks(symbol);
          WatchListModel watchlist = WatchListModel.fromJson(stockData);
          yield watchlist;
        } catch (e) {
          print('Error fetching data for $symbol: $e');
        }
      }
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
