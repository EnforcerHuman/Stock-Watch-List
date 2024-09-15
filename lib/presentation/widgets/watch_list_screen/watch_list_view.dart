import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/data/datasources/watch_list_data_source_impl.dart';
import 'package:stock_watchlist/data/repositories/watch_list_repo_impl.dart';
import 'package:stock_watchlist/domain/usecase/watch_list_use_case.dart';
import 'package:stock_watchlist/presentation/bloc/watch_list_bloc/watch_list_bloc.dart';
import 'package:stock_watchlist/presentation/widgets/error_manager.dart';
import 'package:stock_watchlist/presentation/widgets/watch_list_screen/wath_list_items_section.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WatchListBloc>().add(const LoadWatchListData());
    WatchListUseCase watchListUseCase =
        WatchListUseCase(WatchListRepositioryImpl(WatchListDataSourceImpl()));
    watchListUseCase.call();
    return Column(
      children: [
        BlocBuilder<WatchListBloc, WatchListState>(
          builder: (context, state) {
            if (state is WatchListDataLoaded) {
              if (state.watchListData.isEmpty) {
                return const Center(
                  child: Text('NO ITEMS IN WATCH LIST'),
                );
              } else {
                return WatchListItemsSection(state: state);
              }
            } else if (state is WatchListDataPartiallyLoaded) {
              return WatchListItemsSection(state: state);
            } else if (state is WatchListDataFailed) {
              return ErrorManager(errorMessage: state.error);
            } else if (state is WatchListDataLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const ErrorManager(errorMessage: 'UNEXPECTED ERROR');
            }
          },
        ),
      ],
    );
  }
}
