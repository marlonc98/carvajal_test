import 'package:carvajal_test/back/model/ProductModel.dart';

class ProductController {
  static Future<List<ProductModel>?> getProducts() async {
    const relativeUrl = '/product';
    List response = [
      {
        "id": 1,
        "name": "Billetera",
        "description": "Billetera de cuero negro",
        "reference": "REF-005",
        "status": "inactive",
        "image": "https://img.lovepik.com/photo/50078/3603.jpg_wh860.jpg",
        "inventory": {
          "unit": "piece",
          "availableQuantity": 150,
          "unitCost": 560,
          "initialQuantity": 320,
          "warehouses": [
            {
              "id": "1",
              "name": "Bodega Norte",
              "observations": null,
              "isDefault": true,
              "address": "Dirección de la bodega Norte",
              "status": "active",
              "initialQuantity": "320.0",
              "availableQuantity": "150",
              "minQuantity": "100",
              "maxQuantity": "400"
            }
          ]
        },
      },
      {
        "id": 1,
        "name": "Billetera",
        "description": "Billetera de cuero negro",
        "reference": "REF-005",
        "status": "inactive",
        "image": "https://image.freepik.com/psd-gratis/maqueta-billetera-delgada-cuero_1332-5065.jpg",
        "inventory": {
          "unit": "piece",
          "availableQuantity": 150,
          "unitCost": 560,
          "initialQuantity": 320,
          "warehouses": [
            {
              "id": "1",
              "name": "Bodega Norte",
              "observations": null,
              "isDefault": true,
              "address": "Dirección de la bodega Norte",
              "status": "active",
              "initialQuantity": "320.0",
              "availableQuantity": "150",
              "minQuantity": "100",
              "maxQuantity": "400"
            }
          ]
        },
      },
      {
        "id": 1,
        "name": "Billetera",
        "description": "Billetera de cuero negro",
        "reference": "REF-005",
        "status": "inactive",
        "image": "https://media.moma.com.co/2436-home_default/billetera-broche-ls4010.jpg",
        "inventory": {
          "unit": "piece",
          "availableQuantity": 150,
          "unitCost": 560,
          "initialQuantity": 320,
          "warehouses": [
            {
              "id": "1",
              "name": "Bodega Norte",
              "observations": null,
              "isDefault": true,
              "address": "Dirección de la bodega Norte",
              "status": "active",
              "initialQuantity": "320.0",
              "availableQuantity": "150",
              "minQuantity": "100",
              "maxQuantity": "400"
            }
          ]
        },
      },
      {
        "id": 1,
        "name": "Billetera",
        "description": "Billetera de cuero negro",
        "reference": "REF-005",
        "status": "inactive",
        "image": "https://http2.mlstatic.com/D_NQ_NP_676257-MCO46129733044_052021-O.jpg",
        "inventory": {
          "unit": "piece",
          "availableQuantity": 150,
          "unitCost": 560,
          "initialQuantity": 320,
          "warehouses": [
            {
              "id": "1",
              "name": "Bodega Norte",
              "observations": null,
              "isDefault": true,
              "address": "Dirección de la bodega Norte",
              "status": "active",
              "initialQuantity": "320.0",
              "availableQuantity": "150",
              "minQuantity": "100",
              "maxQuantity": "400"
            }
          ]
        },
      },
    ];

    return response.map((e) => ProductModel.fromJson(e)).toList();
  }
}
