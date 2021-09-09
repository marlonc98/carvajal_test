import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:carvajal_test/GlobalVars/Language/User/UserProvider.dart';
import 'package:carvajal_test/Utils/ShowModal.dart';
import 'package:carvajal_test/Utils/Validatos.dart';
import 'package:carvajal_test/back/model/UserModel.dart';
import 'package:carvajal_test/screens/HomePage.dart';
import 'package:carvajal_test/screens/Widgets/Button.dart';
import 'package:carvajal_test/screens/widgets/TextStyled.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const route = "/register";
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool activeForm = true;
  Map<String, dynamic> values = {};
  late AppLocalizations localizations;
  late UserProvider userProvider;

  _register() async {
    setState(() {
      activeForm = false;
    });
    UserModel? user = await userProvider.register(values);
    if (user != null)
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.route, (route) => false);
    else {
      ShowModal.showSnackBar(
          context: context,
          text: localizations.translate(
              keyText: KeyWordsLocalization.RegisterWrong));
      setState(() {
        activeForm = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
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
                    text: localizations.translate(
                        keyText: KeyWordsLocalization.RegisterWelcome),
                    type: TextStyledType.h2,
                  )),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(localizations.translate(
                          keyText: KeyWordsLocalization.RegisterLogin)))
                ],
              ),
            ),
            TextStyled(
              text: localizations.translate(
                  keyText: KeyWordsLocalization.RegisterWelcomeSubtitle),
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
                            keyText: KeyWordsLocalization.RegisterName),
                      ),
                      validator: (value) => Validators.check(
                          isRequired: true,
                          text: value,
                          fields: values,
                          key: 'name',
                          context: context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: localizations.translate(
                            keyText: KeyWordsLocalization.RegisterLastname),
                      ),
                      validator: (value) => Validators.check(
                          minLength: 6,
                          isRequired: true,
                          text: value,
                          fields: values,
                          key: 'lastname',
                          context: context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: localizations.translate(
                            keyText: KeyWordsLocalization.RegisterAddress),
                      ),
                      validator: (value) => Validators.check(
                          isRequired: true,
                          text: value,
                          fields: values,
                          key: 'address',
                          context: context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      onChanged: (val)=>values["gender"] = val,
                      hint: Text(localizations.translate(keyText: KeyWordsLocalization.RegisterGender)),
                        validator: (value) => Validators.check(
                            isRequired: true,
                            text: value,
                            fields: values,
                            key: 'gender',
                            context: context),
                        items: ["Masculino", "Femenino"]
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList()),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: localizations.translate(
                            keyText: KeyWordsLocalization.RegisterEmail),
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
                            keyText: KeyWordsLocalization.RegisterPassword),
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
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: localizations.translate(
                            keyText:
                                KeyWordsLocalization.RegisterConfirmPassword),
                      ),
                      obscureText: true,
                      validator: (value) => Validators.check(
                          minLength: 6,
                          text: value,
                          fields: values,
                          matchFieldName: localizations.translate(
                              keyText: KeyWordsLocalization
                                  .RegisterConfirmPasswordNotMatch),
                          key: 'password_confirmation',
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
                              text: localizations.translate(
                                  keyText: KeyWordsLocalization.LoginRecovery),
                              color: Colors.black,
                            ))
                      ],
                    ),
                    Button(
                        active: activeForm,
                        onTap: _register,
                        text: localizations.translate(
                            keyText: KeyWordsLocalization.RegisterRegister)),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
