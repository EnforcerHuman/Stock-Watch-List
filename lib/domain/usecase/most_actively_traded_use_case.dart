import 'package:stock_watchlist/data/models/top_gainers.dart';
import 'package:stock_watchlist/domain/repositories/most_actively_traded_repository.dart';

class GetMostActivelyTrades {
  MostActivelyTradedRepository repository;
  GetMostActivelyTrades(this.repository);
  Future<TopGainers> call() {
    List<TopGainers> test = [];
    return repository.fetchMostActivelyTraded();

    // try {
    //   return repository.fetchMostActivelyTraded();
    // } catch (e) {
    //   print('print from usecase');
    // }
  }
}
