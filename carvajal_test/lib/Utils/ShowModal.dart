import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowModal {
  static void openDialog(
      {required context,
      String title = '',
      String text = '',
      List<Widget>? actions}) {
    final localization = AppLocalizations.of(context);
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: actions ??
                  [
                    TextButton(
                        child: Text(localization.translate(
                            keyText: KeyWordsLocalization.accept)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
            ));
  }

  static void showLoading({required context}) {
    showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Dialog(
              backgroundColor: Color(0xCC000000),
              child: new Container(
                  alignment: FractionalOffset.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(20.0),
                  child: CupertinoActivityIndicator(
                    animating: true,
                  )),
            ));
  }

  static void showSnackBar({required context, required text, bool? error}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: error != null ? Colors.red : null,
          content: Text(text)),
    );
  }
}
