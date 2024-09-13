import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/data/datasources/most_actively_traded_data_source_impl.dart';
import 'package:stock_watchlist/data/models/top_gainers.dart';
import 'package:stock_watchlist/presentation/bloc/watch_list_bloc/watch_list_bloc.dart';
import 'package:stock_watchlist/presentation/widgets/error_manager.dart';
import 'package:stock_watchlist/presentation/widgets/stock_card.dart';
import 'package:http/http.dart' as http;

class WatchListView extends StatelessWidget {
  WatchListView({super.key});
  final List<String> watchList = ['AAPL', 'GOOG', 'TSLA'];

  @override
  Widget build(BuildContext context) {
    // context.read<WatchListBloc>().add(LoadWatchListData(watchList));

    return Column(
      children: [
        BlocBuilder<WatchListBloc, WatchListState>(
          builder: (context, state) {
            print('state from watch list view $state ');
            if (state is WatchListDataLoaded) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: state.watchListData.length,
                      itemBuilder: (context, index) {
                        return StockCard(
                          onPressed: () async {
                            // MostActivelyTradedRemoteDataSourceImpl
                            //     mostActivelyTradedRemoteDataSourceImpl =
                            //     MostActivelyTradedRemoteDataSourceImpl(
                            //         client: http.Client());
                            // TopGainers gainers =
                            //     await mostActivelyTradedRemoteDataSourceImpl
                            //         .fetchMostActivelyTraded();
                            // print('Print from Home screeen view');
                            // print(gainers.mostActivelyTraded.toString());
                            final url = Uri.parse(
                                'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=AAPL&apikey=6MYAK98OE63PA571');
                            final result = await http.get(url);
                            print(result.body);
                          },
                          stockName: state.watchListData[index].companyName,
                          stockPrice:
                              state.watchListData[index].lastDayClosingPrice,
                        );
                      }));
            } else if (state is WatchListDataFailed) {
              return ErrorManager(errorMessage: state.error);
            } else {
              return const ErrorManager(errorMessage: 'UNEXPECTED ERROR');
            }
          },
        ),
      ],
    );
  }
}
