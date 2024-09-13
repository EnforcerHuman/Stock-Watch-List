import 'dart:convert';
import 'package:stock_watchlist/data/models/most_actively_traded_model.dart';

TopGainers topGainersFromJson(String str) =>
    TopGainers.fromJson(json.decode(str));

String topGainersToJson(TopGainers data) => json.encode(data.toJson());

class TopGainers {
  String lastUpdated;

  List<MostActivelyTradedModel> mostActivelyTraded;

  TopGainers({
    required this.lastUpdated,
    required this.mostActivelyTraded,
  });

  factory TopGainers.fromJson(Map<String, dynamic> json) => TopGainers(
        lastUpdated: json["last_updated"],
        mostActivelyTraded: List<MostActivelyTradedModel>.from(
            json["most_actively_traded"]
                .map((x) => MostActivelyTradedModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "last_updated": lastUpdated,
        "most_actively_traded":
            List<dynamic>.from(mostActivelyTraded.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'TopGainers(lastUpdated: $lastUpdated, '
        'mostActivelyTraded: ${mostActivelyTraded.map((e) => e.toString()).toList()})';
  }
}
