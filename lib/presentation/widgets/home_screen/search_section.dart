import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_bloc.dart';
import 'package:stock_watchlist/presentation/bloc/stock_search_bloc/stock_search_event.dart';

// ignore: must_be_immutable
class SearchSection extends StatelessWidget {
  SearchSection({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SearchBar(
        controller: controller,
        onChanged: (value) {
          context.read<StockSearchBloc>().add(SearchStocksEvent(value));
        },
      ),
    );
  }
}
