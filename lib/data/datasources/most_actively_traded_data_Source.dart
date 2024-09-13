import 'package:stock_watchlist/data/models/top_gainers.dart';

abstract class MostActivelyTradedRemoteDataSource {
  Future<TopGainers> fetchMostActivelyTraded();
}
