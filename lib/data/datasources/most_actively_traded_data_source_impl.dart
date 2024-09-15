// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:stock_watchlist/data/models/top_gainers.dart';

// class MostActivelyTradedRemoteDataSource {
//   final http.Client client;

//   MostActivelyTradedRemoteDataSource(
//     this.client,
//   );

//   Future<TopGainers> fetchMostActivelyTraded() async {
//     final response = await client.get(Uri.parse(
//         'https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=FMQIKB4SZGP5UAB8'));
//     print('RESPOSE STATUS CODE : ${response.statusCode}');
//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonData = json.decode(response.body);
//       print(jsonData);
//       TopGainers topGainers = TopGainers.fromJson(jsonData);
//       print('***************************');
//       print(topGainers.mostActivelyTraded.toString());
//       return topGainers;
//     } else {
//       throw Exception('Failed to load most actively traded data');
//     }
//   }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:stock_watchlist/data/models/top_gainers.dart';

/// Fetches data for most actively traded stocks from a remote API
class MostActivelyTradedRemoteDataSource {
  final http.Client client;

  MostActivelyTradedRemoteDataSource(this.client);

  /// Fetches the most actively traded stocks data
  ///
  /// Returns a [TopGainers] object containing the fetched data
  /// Throws an exception if the API call fails
  Future<TopGainers> fetchMostActivelyTraded() async {
    final Uri url = Uri.parse(
        'https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=FMQIKB4SZGP5UAB8');

    final response = await client.get(url);

//This Api only return 200 Status code even if tried to accesss wrong end point
//
//
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      print(jsonData);

      TopGainers topGainers = TopGainers.fromJson(jsonData);

      return topGainers;
    } else {
      throw Exception('Failed to load most actively traded data');
    }
  }
}
