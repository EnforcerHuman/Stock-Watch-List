class WatchListModel {
  final String companyName;
  final String lastDayClosingPrice;

  WatchListModel(
      {required this.companyName, required this.lastDayClosingPrice});

  // Factory constructor to create a StockData instance from JSON
  factory WatchListModel.fromJson(Map<String, dynamic> json) {
    // Extract company name
    String companyName = json["symbol"];
//
    // Get the latest date
    // String latestDate = json['date'];

    String lastDayClosingPrice = json['close'] ?? ' closing price';

    return WatchListModel(
      companyName: companyName,
      lastDayClosingPrice: lastDayClosingPrice,
    );
  }
  @override
  String toString() {
    return 'Company Name: $companyName\nLast Day\'s Closing Price: $lastDayClosingPrice';
  }
}
