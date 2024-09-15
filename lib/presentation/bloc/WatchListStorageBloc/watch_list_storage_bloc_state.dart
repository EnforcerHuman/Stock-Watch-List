part of 'watch_list_storage_bloc_bloc.dart';

sealed class WatchListStorageBlocState extends Equatable {
  const WatchListStorageBlocState();

  @override
  List<Object> get props => [];
}

final class WatchListStorageBlocInitial extends WatchListStorageBlocState {}

final class WatchListItemAdded extends WatchListStorageBlocState {}

final class WatchListItemDeleted extends WatchListStorageBlocState {}

final class WatchListItemAddFailed extends WatchListStorageBlocState {}

final class WatchListItemDeleteFailed extends WatchListStorageBlocState {}

final class WatchListItemAdding extends WatchListStorageBlocState {}
