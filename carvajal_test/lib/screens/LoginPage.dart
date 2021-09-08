import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:carvajal_test/Utils/Validatos.dart';
import 'package:carvajal_test/screens/RegisterPage.dart';
import 'package:carvajal_test/screens/Widgets/Button.dart';
import 'package:carvajal_test/screens/widgets/TextStyled.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const route = "/login";
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool activeForm = true;
  Map<String, dynamic> values = {};
  late AppLocalizations localizations;

  _login() {
    print(values);
  }

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset('assets/logos/logo.png'),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: TextStyled(
                    text: "Welcome",
                    type: TextStyledType.h2,
                  )),
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, RegisterPage.route),
                      child: Text("registrate"))
                ],
              ),
            ),
            TextStyled(
              text: "Inicia sesión para continuar",
              light: true,
            ),
            SizedBox(height: 16.0),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: localizations.translate(
                            keyText: KeyWordsLocalization.loginEmail),
                      ),
                      validator: (value) => Validators.check(
                          isEmail: true,
                          text: value,
                          fields: values,
                          key: 'email',
                          context: context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: localizations.translate(
                            keyText: KeyWordsLocalization.loginPassword),
                      ),
                      obscureText: true,
                      validator: (value) => Validators.check(
                          minLength: 6,
                          text: value,
                          fields: values,
                          key: 'password',
                          context: context),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () => {},
                            child: TextStyled(
                              text: "Olvidaste tu contraseña?",
                              color: Colors.black,
                            ))
                      ],
                    ),
                    Button(
                        active: activeForm,
                        onTap: _login,
                        text: localizations.translate(
                            keyText: KeyWordsLocalization.loginLogin)),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
