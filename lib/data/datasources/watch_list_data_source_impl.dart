import 'dart:convert';
import 'package:http/http.dart' as http;

/// A data source class responsible for fetching stock data
/// from the Alpha Vantage API.
class WatchListDataSourceImpl {
  // API keys for accessing Alpha Vantage stock data
  final String _apiKey = '6MYAK98OE63PA571';
  final String _apiKey2 = 'FMQIKB4SZGP5UAB8';

  /// Fetches stock data for the given [symbol] using the Alpha Vantage API.
  ///
  /// This function retrieves the latest time series daily data.
  /// Throws an [Exception] if no data is available or if the request fails.
  Future<Map<String, dynamic>> fetchWatchListData(String symbol) async {
    print('print from watchListData');

    // Build the request URL using the second API key
    final url = Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$symbol&apikey=$_apiKey2');

    // Perform the HTTP GET request
    final response = await http.get(url);

    // Check if the response is successful (status code 200)
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Validate the 'Time Series (Daily)' field in the response
      final timeSeries = data['Time Series (Daily)'];
      if (timeSeries == null || timeSeries.isEmpty) {
        throw Exception('No time series data available');
      }

      // Retrieve the latest data entry
      final latestDate = timeSeries.keys.first;
      final latestData = timeSeries[latestDate];

      if (latestData == null) {
        throw Exception('No data available for the latest date');
      }

      // Return a structured map of stock data
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
      // Throw an exception if the API call failed
      throw Exception('Failed to load stock data');
    }
  }
}
