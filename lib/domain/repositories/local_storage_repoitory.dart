import 'package:stock_watchlist/data/models/wacth_list_item_model.dart';
import 'package:stock_watchlist/domain/entities/watch_list.dart';

abstract class LocalStorageRepoitory {
  Future<void> insertItem(String stockName);
  Future<List<WacthListItemModel>> getAllWatchListItems();
  Future<void> updateStringList(WatchList stringList);
  Future<void> deleteWatchListItem(int id);
}
