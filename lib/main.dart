import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stock_watchlist/core/network/api_client.dart';
import 'package:stock_watchlist/core/network/network.dart';
import 'package:stock_watchlist/data/datasources/most_actively_traded_data_source_impl.dart';
import 'package:stock_watchlist/data/datasources/stock_search_data_source.dart';
import 'package:stock_watchlist/data/datasources/watch_list_data_source_impl.dart';
import 'package:stock_watchlist/data/repositories/most_actively_traded_repo_impl.dart';
import 'package:stock_watchlist/data/repositories/stock_search_repository.dart';
import 'package:stock_watchlist/data/repositories/watch_list_repo_impl.dart';
import 'package:stock_watchlist/domain/usecase/most_actively_traded_use_case.dart';
import 'package:stock_watchlist/domain/usecase/search_stocks.dart';
import 'package:stock_watchlist/domain/usecase/watch_list_use_case.dart';
import 'package:stock_watchlist/presentation/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/most_traded.dart/most_traded_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/watch_list_bloc/watch_list_bloc.dart';
import 'package:stock_watchlist/presentation/screens/main_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainNavigationBloc(),
        ),
        BlocProvider(
            create: (context) => MostTradedBloc(GetMostActivelyTrades(
                MostActivelyTradedRepositoryImpl(
                    NetworkInfoImpl(InternetConnectionChecker()),
                    remoteDataSource:
                        MostActivelyTradedRemoteDataSource(http.Client()))))
              ..add(LoadMostTradedItems())),
        BlocProvider(
            create: (context) => WatchListBloc(WatchListUseCase(
                WatchListRepositioryImpl(WatchListDataSourceImpl())))
              ..add(const LoadWatchListData(['AAPL', 'GOOG', 'TSLA', 'NVDA']))),
        BlocProvider(
            create: (context) => StockSearchBloc(SearchStocks(
                StockSearchRepositoryImpl(
                    StockSearchRemoteDataSourceImpl(ApiClients())))))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreen(),
      ),
    );
  }
}
