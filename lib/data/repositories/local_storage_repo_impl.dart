import 'package:stock_watchlist/data/datasources/local_data_storage.dart';
import 'package:stock_watchlist/data/models/wacth_list_item_model.dart';
import 'package:stock_watchlist/domain/entities/watch_list.dart';
import 'package:stock_watchlist/domain/repositories/local_storage_repoitory.dart';

class LocalStorageRepoImpl implements LocalStorageRepoitory {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<void> insertItem(String stockName) async {
    databaseHelper.insertValue(stockName);
  }

  @override
  Future<void> deleteWatchListItem(int id) async {
    await databaseHelper.deleteItem(id);
  }

  @override
  Future<List<WacthListItemModel>> getAllWatchListItems() async {
    List<Map<String, dynamic>> items = await databaseHelper.getItems();
    List<WacthListItemModel> watchListItems = [];
    for (var item in items) {
      watchListItems.add(WacthListItemModel.fromMap(item));
    }
    return watchListItems;
  }

  @override
  Future<void> updateStringList(WatchList stringList) {
    // TODO: implement updateStringList
    throw UnimplementedError();
  }
}
