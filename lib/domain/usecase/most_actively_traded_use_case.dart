import 'package:dartz/dartz.dart';
import 'package:stock_watchlist/core/error/failures.dart';
import 'package:stock_watchlist/data/models/top_gainers.dart';
import 'package:stock_watchlist/domain/repositories/most_actively_traded_repository.dart';
import 'package:dartz/dartz.dart';

class GetMostActivelyTrades {
  final MostActivelyTradedRepository repository;

  GetMostActivelyTrades(this.repository);

  Future<Either<String, TopGainers>> call() async {
    Either<Failure, TopGainers> result =
        await repository.fetchMostActivelyTraded();

    // Use fold to handle the possible outcomes
    return result.fold(
      (failure) {
        // This block is executed if the result is a failure (Left)
        print('Failure: ${failure.message}');
        return Left(failure.message); // Return a Left with the failure message
      },
      (topGainers) {
        // This block is executed if the result is a success (Right)
        print('Success: $topGainers');
        return Right(topGainers); // Return a Right with the top gainers
      },
    );
  }
}
