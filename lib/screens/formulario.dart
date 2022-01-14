import 'package:flutter/material.dart';
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: _rotuloCampoNumeroConta,
            dica: _dicaCampoNumeroConta,
          ),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on),
          ElevatedButton(
            child: Text(_textoBotaoConfirmar),
            onPressed: () => _criaTransferencia(),
          )
        ])));
  }

  void _criaTransferencia() {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
      // ScaffoldMessenger.of('context').showSnackBar(SnackBar(
      //     content: Text('Transferência cadastrada.' +
      //         ' Conta ' +
      //         transferenciaCriada.numeroConta.toString() +
      //         ' valor: ' +
      //         transferenciaCriada.valor.toString())));
    }
  }
}
