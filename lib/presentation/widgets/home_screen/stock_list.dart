import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stock_watchlist/presentation/bloc/WatchListStorageBloc/watch_list_storage_bloc_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_state.dart';
import 'package:stock_watchlist/presentation/bloc/watch_list_bloc/watch_list_bloc.dart';
import 'package:stock_watchlist/presentation/widgets/search_result_card.dart';
import 'package:stock_watchlist/presentation/widgets/watch_list_screen/most_traded_stocks.dart';

class StockList extends StatelessWidget {
  const StockList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockSearchBloc, StockSearchState>(
      listener: (context, state) {
        if (state is StockSearchCancelled) {
          context.read<WatchListBloc>().add(const LoadWatchListData());
        }
      },
      builder: (context, state) {
        print('State of search bloc $state');
        if (state is StockSearchCancelled || state is StockSearchInitial) {
          return const MostTradedStocks();
        } else if (state is StockSearchLoading) {
          return const CircularProgressIndicator();
        } else if (state is StockSearchLoaded) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  return SearchResultCard(
                    onPressed: () {
                      context
                          .read<WatchListStorageBlocBloc>()
                          .add(AddWatchListItem(state.results[index].symbol));
                    },
                    stockName: state.results[index].name,
                    region: state.results[index].region,
                    symbol: state.results[index].symbol,
                  );
                }),
          );
        } else {
          return const Text('unexpected error');
        }
      },
    );
  }
}
