import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClients {
  final String baseUrl = 'https://www.alphavantage.co/query';
  final String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key

  Future<Map<String, dynamic>> get(
      String endpoint, Map<String, String> params) async {
    final url = Uri.parse('$baseUrl?$endpoint');
    final response = await http.get(url.replace(queryParameters: {
      ...params,
      'apikey': apiKey,
    }));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
