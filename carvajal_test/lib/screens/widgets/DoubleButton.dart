import 'package:flutter/material.dart';

import 'Button.dart';

class DoubleButton extends StatelessWidget {
  final String firstButtonText, secondButtonText;
  final VoidCallback firstButtonTap, secondButtonTap;
  DoubleButton(
      {Key? key,
      required this.firstButtonTap,
      required this.firstButtonText,
      required this.secondButtonTap,
      required this.secondButtonText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(
          onTap: this.firstButtonTap,
          text: this.firstButtonText,
          width: MediaQuery.of(context).size.width * .4,
          type: TypeButton.NotLineMain,
        ),
        Button(
          onTap: this.secondButtonTap,
          text: this.secondButtonText,
          width: MediaQuery.of(context).size.width * .4,
          type: TypeButton.Main,
        ),
      ],
    );
  }
}
