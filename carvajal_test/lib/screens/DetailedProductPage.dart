import 'package:flutter/material.dart';

class DetailedProductPage extends StatefulWidget{
  static const route = "/detailedProdct";
  final int id;
  DetailedProductPage({key, required this.id}):super(key:key);
  _DetailedProductPageState createState()=> _DetailedProductPageState();
}

class _DetailedProductPageState extends State<DetailedProductPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  
}