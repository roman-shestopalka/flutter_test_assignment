class HouseModel {
  final int? id;
  final String name;
  final int floorsCount;

  HouseModel({
    required this.id,
    required this.name,
    required this.floorsCount,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "floorsCount": floorsCount,
    };
  }
}
