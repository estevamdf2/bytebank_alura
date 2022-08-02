import 'package:flutter/material.dart';

import '../../components/editor.dart';

const _tituloAppBar = 'Receber depósito';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'valor';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controladorCampoValor =
        TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on),
          ElevatedButton(
            child: Text(_textoBotaoConfirmar),
            onPressed: () => _criaDeposito(context),
          )
        ])));
  }

  _criaDeposito(context) {
    Navigator.pop(context);
  }
}
