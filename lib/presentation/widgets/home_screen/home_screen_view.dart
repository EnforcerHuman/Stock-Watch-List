import 'package:flutter/material.dart';
import 'package:stock_watchlist/presentation/widgets/home_screen/search_section.dart';
import 'package:stock_watchlist/presentation/widgets/home_screen/stock_list.dart';

/// This widget represents the body of the Home screen.
/// It organizes the different sections of the Home screen,
class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // SearchSection widget handles the search functionality
          SearchSection(),
          //StockList Widget handles showing the stock lists
          const StockList()
        ],
      ),
    );
  }
}
