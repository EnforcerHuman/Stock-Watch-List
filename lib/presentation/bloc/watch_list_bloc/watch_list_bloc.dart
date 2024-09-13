import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/data/models/watch_list_model.dart';
import 'package:stock_watchlist/domain/usecase/watch_list_use_case.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final WatchListUseCase watchListUseCase;
  WatchListBloc(this.watchListUseCase) : super(WatchListInitial()) {
    on<WatchListEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadWatchListData>((event, emit) async {
      try {
        List<WatchListModel> watchListdata =
            await watchListUseCase.call(event.watchListItems);

        emit(WatchListDataLoaded(watchListdata));
      } catch (e) {
        emit(WatchListDataFailed(e.toString()));
      }
    });
  }
}
