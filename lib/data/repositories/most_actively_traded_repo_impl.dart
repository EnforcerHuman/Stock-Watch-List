import 'package:dartz/dartz.dart';
import 'package:stock_watchlist/core/error/failures.dart';
import 'package:stock_watchlist/core/network/network.dart';
import 'package:stock_watchlist/data/datasources/most_actively_traded_data_source_impl.dart';
import 'package:stock_watchlist/data/models/top_gainers.dart';
import 'package:stock_watchlist/domain/repositories/most_actively_traded_repository.dart';

class MostActivelyTradedRepositoryImpl implements MostActivelyTradedRepository {
  final MostActivelyTradedRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MostActivelyTradedRepositoryImpl(this.networkInfo,
      {required this.remoteDataSource});

  @override
  Future<Either<Failure, TopGainers>> fetchMostActivelyTraded() async {
    // Ensure this is awaited correctly

    if (await networkInfo.isConnected) {
      // The network is connected, so attempt to fetch data
      try {
        final TopGainers jsonData =
            await remoteDataSource.fetchMostActivelyTraded();
        return Right(jsonData); // Return the fetched data as Right
      } catch (e) {
        return const Left(
            ServerFailure()); // Return a server failure in case of exceptions
      }
    } else {
      // The network is not connected, return network failure
      return const Left(NetworkFailure());
    }
  }
}
