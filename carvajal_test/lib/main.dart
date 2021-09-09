import 'package:carvajal_test/constants.dart';
import 'package:carvajal_test/route_generator.dart';
import 'package:carvajal_test/screens/LoginPage.dart';
import 'package:carvajal_test/screens/SplashPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'GlobalVars/Language/AppLocalizations.dart';
import 'GlobalVars/Language/LocalizationProvider.dart';
import 'GlobalVars/Language/User/UserProvider.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocalizationProvider>(
          create: (_) => new LocalizationProvider()),
      ChangeNotifierProvider<UserProvider>(create: (_) => new UserProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: SplashPage.route,
      onGenerateRoute: RouteGenerator.generateRoute,
      supportedLocales: [
        const Locale('es', ''),
      ],
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme().copyWith(backgroundColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
          backgroundColor: COLOR_MAIN,
        )
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      locale: Provider.of<LocalizationProvider>(context).locale,
    );
  }
}
