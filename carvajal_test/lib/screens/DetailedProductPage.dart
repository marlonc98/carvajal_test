import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:carvajal_test/back/controllers/ProductController.dart';
import 'package:carvajal_test/back/model/ProductModel.dart';
import 'package:carvajal_test/screens/widgets/TextStyled.dart';
import 'package:flutter/material.dart';

import 'Widgets/Loading.dart';

class DetailedProductPage extends StatefulWidget {
  static const route = "/detailedProdct";
  final int id;
  DetailedProductPage({key, required this.id}) : super(key: key);
  _DetailedProductPageState createState() => _DetailedProductPageState();
}

class _DetailedProductPageState extends State<DetailedProductPage> {
  ProductModel? product;
  @override
  void initState() {
    getProduct();
    super.initState();
  }

  getProduct() async {
    ProductModel? temp = await ProductController.getProduct(widget.id);
    setState(() {
      product = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: product == null
          ? Loading(
              stateLoading: StateLoading.loading,
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 240,
                  backgroundColor: Colors.blueGrey,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(product!.image),
                    title: Text(product!.name),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  ListTile(
                      title: Text(localizations.translate(
                          keyText:
                              KeyWordsLocalization.DetailedProductProductName)),
                      subtitle: Text(product!.name)),
                  ListTile(
                      title: Text(localizations.translate(
                          keyText:
                              KeyWordsLocalization.DetailedProductProductReference)),
                      subtitle: Text(product!.reference)),
                  ListTile(
                      title: Text(localizations.translate(
                          keyText:
                              KeyWordsLocalization.DetailedProductProductStatus)),
                      subtitle: Text(product!.status)),
                  ListTile(
                      title: Text(localizations.translate(
                          keyText:
                              KeyWordsLocalization.DetailedProductInventoryAvailableQuantity)),
                      subtitle: Text(
                          product!.inventory!.availableQuantity.toString())),
                  ListTile(
                      title: Text(localizations.translate(
                          keyText:
                              KeyWordsLocalization.DetailedProductInventoryUnitCost)),
                      subtitle: Text(product!.inventory!.unitCost.toString())),
                      Divider(),
                  ListTile(
                    dense: true,
                      title: TextStyled(
                        type: TextStyledType.h3,
                        text: localizations.translate(
                          keyText: KeyWordsLocalization
                              .DetailedProductWarehouses))),
                  ...product!.inventory!.warehouses!
                      .map((e) => ListTile(
                            title: Text(e.name),
                            subtitle: Text(e.address),
                          ))
                      .toList()
                ]))
              ],
            ),
    );
  }
}
