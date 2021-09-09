import 'package:carvajal_test/back/model/WarehouseModel.dart';

class InventoryModel {
  String unit;
  int availableQuantity;
  int unitCost;
  int initialQuantity;
  List<WarehouseModel>? warehouses;

  InventoryModel({
    required this.unit,
    required this.availableQuantity,
    required this.unitCost,
    required this.initialQuantity,
    this.warehouses,
  });

  InventoryModel.fromJson(Map<String, dynamic> json)
      : unit = json['unit'],
        availableQuantity = json['availableQuantity'],
        unitCost = json['unitCost'],
        initialQuantity = json['initialQuantity'],
        warehouses = json['warehouses'] != null
            ? (json['warehouses'] as List<dynamic>)
                .map((e) => WarehouseModel.fromJson(e))
                .toList()
            : const [];
}
