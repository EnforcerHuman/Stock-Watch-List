import 'dart:convert';
import 'package:http/http.dart' as http;

class WatchListDataSourceImpl {
  final String _apiKey = '6MYAK98OE63PA571';
  final String _apiKey2 = 'FMQIKB4SZGP5UAB8';

  Future<Map<String, dynamic>> fetchWatchListData(String symbol) async {
    print('print from watchListData');
    final url = Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$symbol&apikey=$_apiKey2');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final timeSeries = data['Time Series (Daily)'];
      final latestDate = timeSeries.keys.first;
      final latestData = timeSeries[latestDate];
      return {
        'symbol': symbol,
        'date': latestDate,
        'open': latestData['1. open'],
        'high': latestData['2. high'],
        'low': latestData['3. low'],
        'close': latestData['4. close'],
        'volume': latestData['5. volume'],
      };
    } else {
      throw Exception('Failed to load stock data');
    }
  }
}
