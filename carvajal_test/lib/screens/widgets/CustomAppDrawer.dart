import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:carvajal_test/GlobalVars/Language/User/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppDrawer extends StatelessWidget {
  @override
  Drawer build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(padding: EdgeInsets.all(8.0),
          child: Image.asset('assets/logos/logo.png'),),
          ListTile(
            title: Text(localizations.translate(keyText: KeyWordsLocalization.RegisterName)),
            subtitle: Text(userProvider.user!.name),
          ),
          ListTile(
            title: Text(localizations.translate(keyText: KeyWordsLocalization.RegisterLastname)),
            subtitle: Text(userProvider.user!.lastname),
          ),
          ListTile(
            title: Text(localizations.translate(keyText: KeyWordsLocalization.RegisterEmail)),
            subtitle: Text(userProvider.user!.email),
          ),
          ListTile(
            title: Text(localizations.translate(keyText: KeyWordsLocalization.RegisterAddress)),
            subtitle: Text(userProvider.user!.address),
          ),
          ListTile(
            title: Text(localizations.translate(keyText: KeyWordsLocalization.RegisterGender)),
            subtitle: Text(userProvider.user!.gender),
          ),
        ],
      ),
    );
  }
}
