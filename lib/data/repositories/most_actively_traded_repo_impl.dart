import 'package:stock_watchlist/data/datasources/most_actively_traded_data_Source.dart';
import 'package:stock_watchlist/data/models/top_gainers.dart';
import 'package:stock_watchlist/domain/repositories/most_actively_traded_repository.dart';

class MostActivelyTradedRepositoryImpl implements MostActivelyTradedRepository {
  final MostActivelyTradedRemoteDataSource remoteDataSource;

  MostActivelyTradedRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TopGainers> fetchMostActivelyTraded() async {
    try {
      final TopGainers jsonData =
          await remoteDataSource.fetchMostActivelyTraded();
      return jsonData;
    } catch (e) {
      throw Exception('Failed to fetch most actively traded data');
    }
  }
}
