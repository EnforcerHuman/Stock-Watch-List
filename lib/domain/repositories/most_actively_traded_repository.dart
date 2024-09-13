import 'package:stock_watchlist/data/models/top_gainers.dart';

abstract class MostActivelyTradedRepository {
  Future<TopGainers> fetchMostActivelyTraded();
}
