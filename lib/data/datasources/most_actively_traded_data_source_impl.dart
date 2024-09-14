import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:stock_watchlist/data/models/top_gainers.dart';

class MostActivelyTradedRemoteDataSource {
  final http.Client client;

  MostActivelyTradedRemoteDataSource(
    this.client,
  );

  Future<TopGainers> fetchMostActivelyTraded() async {
    final response = await client.get(Uri.parse(
        'https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=6MYAK98OE63PA571'));
    print('RESPOSE STATUS CODE : ${response.statusCode}');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      print(jsonData);
      TopGainers topGainers = TopGainers.fromJson(jsonData);
      print('***************************');
      print(topGainers.mostActivelyTraded.toString());
      return topGainers;
    } else {
      throw Exception('Failed to load most actively traded data');
    }
  }
}
