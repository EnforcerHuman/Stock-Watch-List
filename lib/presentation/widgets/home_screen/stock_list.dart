import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/data/datasources/watch_list_data_source_impl.dart';
import 'package:stock_watchlist/data/repositories/watch_list_repo_impl.dart';
import 'package:stock_watchlist/domain/usecase/watch_list_use_case.dart';
import 'package:stock_watchlist/presentation/bloc/most_traded.dart/most_traded_bloc.dart';
import 'package:stock_watchlist/presentation/widgets/error_manager.dart';
import 'package:stock_watchlist/presentation/widgets/stock_card.dart';

class StockList extends StatelessWidget {
  const StockList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MostTradedBloc, MostTradedState>(
      listener: (context, state) {
        if (state is MostTradedInitial) {
          context.read<MostTradedBloc>().add(LoadMostTradedItems());
        }
      },
      builder: (context, state) {
        if (state is MostTradedLoaded) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.topGainers.mostActivelyTraded.length,
                itemBuilder: (context, index) {
                  return StockCard(
                    onPressed: () async {
                      final List<String> watchList = ['AAPL', 'GOOG', 'TSLA'];
                      WatchListUseCase watchListUseCase = WatchListUseCase(
                          WatchListRepositioryImpl(WatchListDataSourceImpl()));
                      print(watchListUseCase.call(watchList));
                    },
                    stockName:
                        state.topGainers.mostActivelyTraded[index].ticker,
                    stockPrice: state.topGainers.mostActivelyTraded[index].price
                        .toString(),
                  );
                }),
          );
        } else {
          return const ErrorManager(errorMessage: 'NO DATA FOUND');
        }
      },
    );
  }
}
