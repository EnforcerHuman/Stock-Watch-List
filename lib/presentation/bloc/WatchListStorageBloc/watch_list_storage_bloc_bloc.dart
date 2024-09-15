import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/domain/usecase/watch_list_use_case.dart';
part 'watch_list_storage_bloc_event.dart';
part 'watch_list_storage_bloc_state.dart';

class WatchListStorageBlocBloc
    extends Bloc<WatchListStorageBlocEvent, WatchListStorageBlocState> {
  final WatchListUseCase watchListUseCase;
  WatchListStorageBlocBloc(this.watchListUseCase)
      : super(WatchListStorageBlocInitial()) {
    on<AddWatchListItem>((event, emit) {
      emit(WatchListItemAdding());
      try {
        watchListUseCase.addWatchListItem(event.stockName);
        print('ITEM ADDED');
        emit(WatchListItemAdded());
      } catch (e) {
        print('ITEMn NOT  ADDED');

        emit(WatchListItemAddFailed());
      }
    });
    on<DeleteWatchListItem>((event, emit) {
      try {
        watchListUseCase.deleteWatchListItem(event.id);
        emit(WatchListItemDeleted());
      } catch (e) {
        emit(WatchListItemDeleteFailed());
      }
    });
  }
}
