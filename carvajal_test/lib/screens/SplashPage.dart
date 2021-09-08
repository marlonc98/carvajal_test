import 'package:carvajal_test/GlobalVars/Language/User/UserProvider.dart';
import 'package:carvajal_test/back/model/UserModel.dart';
import 'package:carvajal_test/screens/HomePage.dart';
import 'package:carvajal_test/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const route = "/splash";
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      nextStep();
    });
  }

  nextStep() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    UserModel? user = await userProvider.getUser();
    if (user == null) 
      Navigator.of(context).popAndPushNamed(LoginPage.route);
    else 
        Navigator.of(context).popAndPushNamed(HomePage.route);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Image.asset('assets/logos/logo.png'),
      ),
    ));
  }
}
