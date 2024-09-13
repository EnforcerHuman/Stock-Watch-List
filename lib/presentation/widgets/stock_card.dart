import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/theme/app_colors.dart';

/// A widget that displays information about a stock, including its name, price, and image.
class StockCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String stockName;
  final String stockPrice;

  final bool? isWatchList;
  const StockCard({
    super.key,
    required this.onPressed,
    required this.stockName,
    required this.stockPrice,
    this.isWatchList,
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
          subtitle: Text("StockPrice: \$${stockPrice}"),
          trailing: IconButton(
            icon: Icon((isWatchList ?? false) ? Icons.delete : Icons.add),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
