import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum StateLoading { loading, notResults }

class Loading extends StatelessWidget {
  final List? results;
  final StateLoading? stateLoading;
  Loading({key, this.results, this.stateLoading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            'assets/logos/logo.png',
            height: 100,
          ),
          SizedBox(
            height: 12,
          ),
          results == null || stateLoading == StateLoading.loading
              ? CupertinoActivityIndicator()
              : Text(
                  localization.translate(
                      keyText: KeyWordsLocalization.NoResultsNoResults),
                  textAlign: TextAlign.center,
                ),
        ],
      ),
    );
  }
}
