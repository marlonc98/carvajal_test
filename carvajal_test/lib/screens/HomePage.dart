import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:carvajal_test/back/controllers/ProductController.dart';
import 'package:carvajal_test/back/model/ProductModel.dart';
import 'package:carvajal_test/screens/Widgets/CustomAppDrawer.dart';
import 'package:carvajal_test/screens/widgets/CustomAppBar.dart';
import 'package:carvajal_test/screens/widgets/Loading.dart';
import 'package:flutter/material.dart';

import 'Widgets/TextStyled.dart';

class HomePage extends StatefulWidget {
  static const route = "/homePage";
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel>? products;
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  getProducts() async {
    List<ProductModel>? temp = await ProductController.getProducts();
    setState(() {
      products = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      drawer: CustomAppDrawer(),
      body: products == null || products!.length <= 0
          ? Loading(
              results: products,
            )
          : CustomScrollView(
              slivers: [
                CustomAppBar(
                  title: localizations.translate(keyText: KeyWordsLocalization.HomeOurProducts),
                  allowSearch: true,
                  showAppDrawer: true,
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                    mainAxisExtent: 200,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            InkWell(
                              child: Card(
                                child: Column(children: [
                                  Expanded(
                                    child:
                                        Image.network(products![index].image),
                                  ),
                                  Container(
                                      width: 500,
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          TextStyled(
                                            text: products![index].name,
                                            type: TextStyledType.h4,
                                          ),
                                          TextStyled(
                                            text: products![index].description,
                                          ),
                                        ],
                                      )),
                                ]),
                              ),
                              onTap: () {},
                            ),
                            products![index]
                                        .inventory!
                                        .availableQuantity
                                        .toInt() <=
                                    0
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.9),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: TextStyled(
                                        text: "Sin stock",
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    },
                    childCount: products!.length,
                  ),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
