import 'package:carvajal_test/constants.dart';
import 'package:flutter/material.dart';

enum TextStyledType { h1, h2, h3, h4, h5, normal, smaller, smallest }

class TextStyled extends Text {
  final FontWeight? weight;
  final TextStyledType? type;
  final Color? color;
  final String text;
  final bool light;
  TextStyled(
      {this.weight = FontWeight.normal,
      this.type = TextStyledType.normal,
      required this.text,
      this.light = false,
      this.color})
      : super(text);

  double getSize(type){
    switch (type) {
      case TextStyledType.h1:
        return 32.0;
      case TextStyledType.h2:
        return 24.0;
      case TextStyledType.h3:
        return 18.72;
      case TextStyledType.h4:
        return 16.0;
      case TextStyledType.h5:
        return 13.28;
      default:
      return 12.0;
    }
  }

  FontWeight getWeight(){
    if(this.weight != null) return this.weight!;
    else if (this.type == TextStyledType.h1 || this.type == TextStyledType.h2
    || this.type == TextStyledType.h3 ||this.type == TextStyledType.h4 
    ||this.type == TextStyledType.h5)return FontWeight.bold;
    else return FontWeight.normal;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: getSize(this.type),
        color: this.color ?? (this.light ? COLOR_GRAY: Colors.black),
      ),
    );
  }
}
