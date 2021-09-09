import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:carvajal_test/screens/Widgets/CustomAppDrawer.dart';
import 'package:carvajal_test/screens/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const route = "/homePage";
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      drawer: CustomAppDrawer(),
      body: CustomScrollView(
        slivers: [CustomAppBar(title: "Nuestros productos", allowSearch: true, showAppDrawer: true,)],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
