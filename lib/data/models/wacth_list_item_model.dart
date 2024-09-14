class WacthListItemModel {
  final int id;
  final String stockName;

  WacthListItemModel({required this.id, required this.stockName});

  factory WacthListItemModel.fromMap(Map<String, dynamic> map) {
    return WacthListItemModel(
      id: map['id'],
      stockName: map['stock_name'],
    );
  }

  @override
  String toString() {
    return 'WacthListItemModel(id: $id, stockName: $stockName)';
  }
}
