import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/domain/usecase/search_stocks.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_event.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_state.dart';

class StockSearchBloc extends Bloc<StockSearchEvent, StockSearchState> {
  final SearchStocks searchStocks;

  StockSearchBloc(this.searchStocks) : super(StockSearchInitial()) {
    on<SearchStocksEvent>((event, emit) async {
      emit(StockSearchLoading());
      try {
        final results = await searchStocks(event.query);
        emit(StockSearchLoaded(results));
      } catch (e) {
        emit(StockSearchError(e.toString()));
      }
    });
    on<CancelStockSearch>((event, emit) {
      emit(StockSearchInitial());
    });
  }
}
