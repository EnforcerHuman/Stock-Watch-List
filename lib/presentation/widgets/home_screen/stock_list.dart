import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_state.dart';
import 'package:stock_watchlist/presentation/widgets/stock_card.dart';
import 'package:stock_watchlist/presentation/widgets/watch_list_screen/most_traded_stocks.dart';

class StockList extends StatelessWidget {
  const StockList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockSearchBloc, StockSearchState>(
      listener: (context, state) {
        if (state is StockSearchInitial) {}
      },
      builder: (context, state) {
        if (state is StockSearchInitial) {
          return const MostTradedStocks();
        } else if (state is StockSearchLoading) {
          return const CircularProgressIndicator();
        } else if (state is StockSearchLoaded) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  return StockCard(
                      onPressed: () {},
                      stockName: state.results[index].name,
                      stockPrice: state.results[index].name);
                }),
          );
        } else {
          return const Text('unexpected error');
        }
      },
    );
  }
}


  // if (state is MostTradedLoaded) {
  //         return Expanded(
  //           child: ListView.builder(
  //               itemCount: state.topGainers.mostActivelyTraded.length,
  //               itemBuilder: (context, index) {
  //                 return StockCard(
  //                   onPressed: () async {},
  //                   stockName:
  //                       state.topGainers.mostActivelyTraded[index].ticker,
  //                   stockPrice: state.topGainers.mostActivelyTraded[index].price
  //                       .toString(),
  //                 );
  //               }),
  //         );
  //       } else {
  //         return const ErrorManager(errorMessage: 'NO DATA FOUND');
  //       }