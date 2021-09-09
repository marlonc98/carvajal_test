import 'package:carvajal_test/back/model/InventoryModel.dart';

class ProductModel {
  int id;
  String name;
  String description;
  String reference;
  String status;
  InventoryModel? inventory;
  
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.reference,
    required this.status,
    this.inventory,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        reference = json['reference'],
        status = json['status'],
        inventory = json['inventory'] != null ? InventoryModel.fromJson(json["inventory"]) :null;
}
