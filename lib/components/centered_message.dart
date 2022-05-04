import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  String message = '';
  IconData icon = new IconData(null);
  double iconSize = 0.0;
  double fontSize = 0.0;

  CenteredMessage(
    this.message, {
    this.icon,
    this.iconSize = 64,
    this.fontSize = 24,
  });

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Icon(
              icon,
              size: iconSize,
            ),
            visible: icon != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              message,
              style: TextStyle(fontSize: fontSize),
            ),
          )
        ],
      ),
    );
  }
}
