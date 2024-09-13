import 'package:flutter/material.dart';
import 'package:stock_watchlist/presentation/widgets/watch_list_screen/watch_list_view.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> watchList = ['AAPL', 'GOOG', 'TSLA'];

    // context.read<WatchListBloc>().add(LoadWatchListData(watchList));

    return Scaffold(
      appBar: AppBar(),
      body: WatchListView(),
    );
  }
}
