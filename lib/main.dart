import 'package:flutter/material.dart';
import 'package:bytebank/screens/lista.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
            ).copyWith(
              secondary: Colors.blueAccent[700],
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent[700],
            )),
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.greenAccent[700],
                textTheme: ButtonTextTheme.primary)),
        home: Scaffold(
          body: ListaTransferencias(),
        ));
  }
}
