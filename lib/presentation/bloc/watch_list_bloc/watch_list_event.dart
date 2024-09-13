part of 'watch_list_bloc.dart';

sealed class WatchListEvent extends Equatable {
  const WatchListEvent();

  @override
  List<Object> get props => [];
}

final class LoadWatchListData extends WatchListEvent {
  final List<String> watchListItems;

  const LoadWatchListData(this.watchListItems);
}
