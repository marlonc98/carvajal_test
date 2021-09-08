import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Map<String, dynamic> type;
  final bool active;
  final double width;
  Button({
    Key? key,
    required this.onTap,
    required this.text,
    this.type = TypeButton.Main,
    this.active = true,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: this.width,
        child: TextButton(
          onPressed: this.active ? this.onTap : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !this.active ? CupertinoActivityIndicator() : Container(),
              Text(
                this.text,
                style: TextStyle(color: this.type['color']),
              )
            ],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                this.type[this.active ? 'background' : 'backgroundHover']),
          ),
        ));
  }
}

class TypeButton {
  static const Main = {
    "background": COLOR_MAIN,
    "backgroundHover": COLOR_GRAY,
    "color": Colors.white,
  };
  static const NotLineMain = {
    "background": Colors.transparent,
    "backgroundHover": COLOR_MAIN_DARK,
    "color": COLOR_MAIN,
  };
}
