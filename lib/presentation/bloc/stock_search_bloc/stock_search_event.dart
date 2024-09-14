abstract class StockSearchEvent {}

class SearchStocksEvent extends StockSearchEvent {
  final String query;

  SearchStocksEvent(this.query);
}

class CancelStockSearch extends StockSearchEvent {}
