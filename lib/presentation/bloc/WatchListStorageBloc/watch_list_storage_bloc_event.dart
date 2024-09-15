part of 'watch_list_storage_bloc_bloc.dart';

sealed class WatchListStorageBlocEvent extends Equatable {
  const WatchListStorageBlocEvent();

  @override
  List<Object> get props => [];
}

final class AddWatchListItem extends WatchListStorageBlocEvent {
  final String stockName;

  const AddWatchListItem(this.stockName);
}

final class DeleteWatchListItem extends WatchListStorageBlocEvent {
  final int id;

  const DeleteWatchListItem(this.id);
}
