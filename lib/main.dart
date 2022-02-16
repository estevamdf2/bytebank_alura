import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

//Todo implementar update e delete e depois ir para o kart manager.
void main() {
  runApp(BytebankApp());
  findAll();
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        appBarTheme: AppBarTheme(color: Colors.green[900]),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
