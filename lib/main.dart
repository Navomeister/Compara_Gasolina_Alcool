import 'package:aula010/gasolina_alcool.dart';
import 'package:flutter/material.dart';

// App gasolina ou alcool
// se diferença da gasolina for <= 0.7, melhor abastecer com gasolina
// se não, melhor alcool
// preço alcool / preço gasolina >= 0.7

void main() {
  runApp(MaterialApp(
    title: 'App Gasolina ou Álcool',
    debugShowCheckedModeBanner: false,
    home: GasolinaAlcool(),
  ));
}
