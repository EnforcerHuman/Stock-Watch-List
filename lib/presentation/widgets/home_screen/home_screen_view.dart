import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/WatchListStorageBloc/watch_list_storage_bloc_bloc.dart';
import 'package:stock_watchlist/presentation/widgets/home_screen/search_section.dart';
import 'package:stock_watchlist/presentation/widgets/home_screen/stock_list.dart';
import 'package:stock_watchlist/presentation/widgets/show_toast.dart';

/// This widget represents the body of the Home screen.
/// It organizes the different sections of the Home screen,
class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchListStorageBlocBloc, WatchListStorageBlocState>(
      listener: (context, state) {
        print('state of watch list storage is $state');
        if (state is WatchListItemAdded) {
          showToast(context);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            // SearchSection widget handles the search functionality
            SearchSection(),
            //StockList Widget handles showing the stock lists
            const StockList()
          ],
        );
      },
    );
  }
}
