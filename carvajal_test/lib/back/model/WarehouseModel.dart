class WarehouseModel {
  String id;
  String name;
  String? observations;
  bool isDefault;
  String address;
  String status;
  String initialQuantity;
  String availableQuantity;
  String minQuantity;
  String maxQuantity;
  
  WarehouseModel({
    required this.id,
    required this.name,
    this.observations,
    required this.isDefault,
    required this.address,
    required this.status,
    required this.initialQuantity,
    required this.availableQuantity,
    required this.minQuantity,
    required this.maxQuantity,
  });

  WarehouseModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        observations = json['observations'],
        isDefault = json['isDefault'],
        address = json['address'],
        status = json['status'],
        initialQuantity = json['initialQuantity'],
        availableQuantity = json['availableQuantity'],
        minQuantity = json['minQuantity'],
        maxQuantity = json['maxQuantity'];
}
