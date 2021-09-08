import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  static const route = "/homePage";
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Center(child: Text(localizations.translate(keyText: KeyWordsLocalization.helloWorld)),)
    );
  }

}