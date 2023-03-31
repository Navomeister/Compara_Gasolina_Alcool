// import 'dart:html';

import 'package:flutter/material.dart';

class GasolinaAlcool extends StatefulWidget {
  @override
  State<GasolinaAlcool> createState() => _GasolinaAlcoolState();
}

class _GasolinaAlcoolState extends State<GasolinaAlcool> {
  // const GasolinaAlcool({super.key});

  // back app
  // pegar input dos textfields
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  //vai exibir o resultado
  String _textoResultado = 'Resultado';

  //criar uma função e declarar o controller para double
  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            'Erro: Digite um número válido. (não utilize vírgula)';
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = 'Melhor abastecer com gasolina.';
        });
      }
      else {
        setState(() {
          _textoResultado = 'Melhor abastecer com álcool.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 53, 153),
        title: Text('Alcool ou Gasolina'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32), // espaçamento do app com a logo
          child: Column(
            // alinhamentos
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // alinhamento do tipo alongar (a imagem da logo)
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                // próximo elemento tem espaçamento de 10
                child: Image.asset('image/logo.png'),
              ),
              Align(alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Saiba a melhor opção.', 
                  style: TextStyle(fontSize: 30),),
                ),
              ),
              
              TextField(
                keyboardType: TextInputType.number, // teclado numérico
                decoration: InputDecoration(
                  labelText: 'Preço do Álcool (ex: 2.89)',
                ),
                style: TextStyle(fontSize: 20),
                controller: _controllerAlcool, //pegar o input da gasolina
              ),
              TextField(
                keyboardType: TextInputType.number, // teclado numérico
                decoration: InputDecoration(
                  labelText: 'Preço da Gasolina (ex: 5.51)',
                ),
                style: TextStyle(fontSize: 20),
                controller: _controllerGasolina, //pegar o input da gasolina
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(onPressed: _calcular, 
                  child: Text('Calcular'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 29, 53, 153),
                    textStyle: TextStyle(fontSize: 20)
                  ),
                ),
              ),
              Align(alignment: Alignment.center,
              child:Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(_textoResultado, style: TextStyle(fontSize: 20)),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
