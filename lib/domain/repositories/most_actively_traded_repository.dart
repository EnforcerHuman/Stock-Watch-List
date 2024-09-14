import 'package:dartz/dartz.dart';
import 'package:stock_watchlist/core/error/failures.dart';
import 'package:stock_watchlist/data/models/top_gainers.dart';

abstract class MostActivelyTradedRepository {
  Future<Either<Failure, TopGainers>> fetchMostActivelyTraded();
}
