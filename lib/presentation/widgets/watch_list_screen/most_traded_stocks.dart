import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/WatchListStorageBloc/watch_list_storage_bloc_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/most_traded.dart/most_traded_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/watch_list_bloc/watch_list_bloc.dart';
import 'package:stock_watchlist/presentation/widgets/error_manager.dart';
import 'package:stock_watchlist/presentation/widgets/stock_card.dart';

class MostTradedStocks extends StatelessWidget {
  const MostTradedStocks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostTradedBloc, MostTradedState>(
      builder: (context, state) {
        if (state is MostTradedLoaded) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.topGainers.mostActivelyTraded.length,
                itemBuilder: (context, index) {
                  return StockCard(
                    onPressed: () async {
                      context.read<WatchListStorageBlocBloc>().add(
                          AddWatchListItem(state
                              .topGainers.mostActivelyTraded[index].ticker));
                      context
                          .read<WatchListBloc>()
                          .add(const LoadWatchListData());
                    },
                    stockName:
                        state.topGainers.mostActivelyTraded[index].ticker,
                    stockPrice: state.topGainers.mostActivelyTraded[index].price
                        .toString(),
                  );
                }),
          );
        } else if (state is MostTradedItemsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const ErrorManager(errorMessage: 'NO DATA FOUND');
        }
      },
    );
  }
}
