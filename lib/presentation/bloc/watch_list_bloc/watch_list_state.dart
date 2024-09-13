part of 'watch_list_bloc.dart';

sealed class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object> get props => [];
}

final class WatchListInitial extends WatchListState {}

final class WatchListDataLoaded extends WatchListState {
  final List<WatchListModel> watchListData;

  const WatchListDataLoaded(this.watchListData);
}

final class WatchListDataFailed extends WatchListState {
  final String error;

  const WatchListDataFailed(this.error);
}
