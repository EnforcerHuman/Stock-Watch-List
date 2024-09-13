class StockSearchResult {
  final String symbol;
  final String name;
  final String type;
  final String region;

  StockSearchResult({
    required this.symbol,
    required this.name,
    required this.type,
    required this.region,
  });

  // Optionally, add methods or overrides if needed
  @override
  String toString() {
    return 'StockSearchResult(symbol: $symbol, name: $name, type: $type, region: $region)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StockSearchResult &&
        other.symbol == symbol &&
        other.name == name &&
        other.type == type &&
        other.region == region;
  }

  @override
  int get hashCode =>
      symbol.hashCode ^ name.hashCode ^ type.hashCode ^ region.hashCode;
}
