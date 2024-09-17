import 'package:flutter/material.dart';
import 'package:stock_watchlist/presentation/widgets/custom_app_bar.dart';
import 'package:stock_watchlist/presentation/widgets/watch_list_screen/watch_list_view.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'WATCH LIST'),
      body: WatchListView(),
    );
  }
}
