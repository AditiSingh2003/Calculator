import 'package:flutter/material.dart';
import 'package:claci/main.dart';

class CalculatorButton extends StatelessWidget {
 final String text;
  final  Color fillColor;
  // final  int textColor;
  // final double textSize;
  Function callback;

   CalculatorButton({
    required this.text,
    required this.fillColor,
    // required this.textColor,
    required this.callback,
    // required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 70,
        height: 70,
        child: TextButton(
          onPressed: () {
            callback(text);
            // print(callback);
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(fillColor),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
