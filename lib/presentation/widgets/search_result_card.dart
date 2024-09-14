import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/theme/app_colors.dart';

/// A widget that displays information about a stock, including its name, price, and image.
class SearchResultCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String stockName;
  final String region;
  final String symbol;
  final bool? isWatchList;
  const SearchResultCard({
    super.key,
    required this.onPressed,
    required this.stockName,
    this.isWatchList,
    required this.region,
    required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(0.02),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: AppColors.primaryColor.withOpacity(0.3),
          ),
        ),
        child: ListTile(
          title: Text("Stock name : $stockName"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Symbol: $symbol"),
              Text("StockRegion: $region"),
            ],
          ),
          trailing: IconButton(
            icon: Icon((isWatchList ?? false) ? Icons.delete : Icons.add),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
