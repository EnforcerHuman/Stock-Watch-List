import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClients {
  final String baseUrl = 'https://www.alphavantage.co/query';
  final String apiKey = 'FMQIKB4SZGP5UAB8';

  Future<Map<String, dynamic>> get(
      String endpoint, Map<String, String> params) async {
    final url = Uri.parse('$baseUrl?$endpoint');
    final response = await http.get(url.replace(queryParameters: {
      ...params,
      'apikey': apiKey,
    }));

    if (response.statusCode == 200) {
      print('****************************');
      print(json.decode(response.body));
      print('****************************');

      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
