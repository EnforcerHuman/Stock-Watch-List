import 'package:stock_watchlist/domain/entities/stock_search_result.dart';

abstract class StockSearchState {}

class StockSearchInitial extends StockSearchState {}

class StockSearchLoading extends StockSearchState {}

class StockSearchLoaded extends StockSearchState {
  final List<StockSearchResult> results;

  StockSearchLoaded(this.results);
}

class StockSearchError extends StockSearchState {
  final String message;

  StockSearchError(this.message);
}

class StockSearchCancelled extends StockSearchState {}
