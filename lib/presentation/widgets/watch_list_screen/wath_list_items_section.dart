import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/WatchListStorageBloc/watch_list_storage_bloc_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/watch_list_bloc/watch_list_bloc.dart';
import 'package:stock_watchlist/presentation/widgets/stock_card.dart';

class WatchListItemsSection extends StatelessWidget {
  final WatchListState state;
  const WatchListItemsSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    if (state is WatchListDataLoaded || state is WatchListDataPartiallyLoaded) {
      final watchListData = _getWatchListData();
      return Expanded(
        child: ListView.builder(
          itemCount: watchListData.length,
          itemBuilder: (context, index) =>
              _buildStockCard(context, watchListData[index], index),
        ),
      );
    } else {
      return const Center(child: Text('No data available'));
    }
  }

  List<dynamic> _getWatchListData() {
    if (state is WatchListDataLoaded) {
      return (state as WatchListDataLoaded).watchListData;
    } else if (state is WatchListDataPartiallyLoaded) {
      return (state as WatchListDataPartiallyLoaded).watchListData;
    }
    return [];
  }

  Widget _buildStockCard(BuildContext context, dynamic stock, int index) {
    return StockCard(
      isWatchList: true,
      onPressed: () => _onStockCardPressed(context, index),
      stockName: stock.companyName,
      stockPrice: stock.lastDayClosingPrice,
    );
  }

  void _onStockCardPressed(BuildContext context, int index) {
    context.read<WatchListStorageBlocBloc>().add(DeleteWatchListItem(index));
    context.read<WatchListBloc>().add(const LoadWatchListData());
  }
}
