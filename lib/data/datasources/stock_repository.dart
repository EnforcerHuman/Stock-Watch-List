import 'package:http/http.dart' as http;

abstract class StockRepository {}

class StockRepositoryImpl implements StockRepository {
  final http.Client client;

  StockRepositoryImpl(this.client);
}
