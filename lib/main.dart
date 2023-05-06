import 'package:flutter/material.dart';
import './widget/calculator_button.dart';


void main() {
  runApp(CalculatorApp());
}
class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

//logic
  int _firstNum =0;
  int _secondNum =0;
  String _history = '';
  String _textToDisplay = '';
  String _res ='';
  String  _operation ='';

  void btnOnClick(btnVal)
  {
    print(btnVal);
    if(btnVal == 'C'){
      _textToDisplay ='';
      _firstNum=0;
      _secondNum=0;
      _res = '';
    }
    else if (btnVal == 'AC')
    {
      _textToDisplay ='0';
      _firstNum=0;
      _secondNum=0;
      _res = '';
      _history = '';
    }
    else if (btnVal == '+' || btnVal == '-' || btnVal == 'X' || btnVal =='/' || btnVal =='%')
    {
      _firstNum= int.parse(_textToDisplay);
      _res='';
      _operation = btnVal;
    }
    else if(btnVal == '+/-')
    {
      if(_textToDisplay[0] != '-')
      {
        _res = '-'+_textToDisplay;
      }
      else{
        _res = _textToDisplay.substring(1);
      }
    }
    else if(btnVal == '<')
    {
      _res = _textToDisplay.substring(0,_textToDisplay.length-1);
    }
    else if(btnVal == '=') {
      _secondNum = int.parse(_textToDisplay);
      if (_operation == '%') {
        _res = (_firstNum % _secondNum).toString();
        _history =
            _firstNum.toString() + _operation.toString() + _secondNum.toString();
      }
      if (_operation == '+') {
        _res = (_firstNum + _secondNum).toString();
        _history =
            _firstNum.toString() + _operation.toString() + _secondNum.toString();
      }
      if (_operation == '-') {
        _res = (_firstNum - _secondNum).toString();
        _history =
            _firstNum.toString() + _operation.toString() + _secondNum.toString();
      }
      if (_operation == 'X') {
        _res = (_firstNum * _secondNum).toString();
        _history =
            _firstNum.toString() + _operation.toString() + _secondNum.toString();
      }
      if (_operation == '/') {
        _res = (_firstNum / _secondNum).toString();
        _history =
            _firstNum.toString() + _operation.toString() + _secondNum.toString();
      }
    }
      else {
        _res = int.parse(_textToDisplay + btnVal).toString();
      }
      setState(() {
        _textToDisplay = _res;
      });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(title: Text('Calculator'), backgroundColor: Colors.black26,),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      _history,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0,1.0),
                ),
                Container(
                  child: Padding(padding: EdgeInsets.all(12),
                      child: Text(
                        '$_textToDisplay',
                        style: TextStyle(fontSize: 48,
                            color:Colors.white,
                        ),
                      ),
                  ),
                  alignment: Alignment(1.0,1.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: 'AC',
                    callback: btnOnClick,
                    fillColor: Colors.grey,
                    // textColor: Colors.white,
                    ),
                    CalculatorButton(text: 'C',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                      ),
                    CalculatorButton(text: '%',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '/',
                      callback: btnOnClick,
                      fillColor: Colors.amber,
                      // textColor: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: '9',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                      ),
                    CalculatorButton(text: '8',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '7',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: 'X',
                      callback: btnOnClick,
                      fillColor: Colors.amber,
                      // textColor: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: '6',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '5',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                      ),
                    CalculatorButton(text: '4',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '-',
                      callback: btnOnClick,
                      fillColor: Colors.amber,
                      // textColor: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: '3',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '2',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '1',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '+',
                      callback: btnOnClick,
                      fillColor: Colors.amber,
                      // textColor: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(text: '+/-',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '0',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '<',
                      callback: btnOnClick,
                      fillColor: Colors.grey,
                      // textColor: Colors.black,
                    ),
                    CalculatorButton(text: '=',
                      callback: btnOnClick,
                      fillColor: Colors.amber,
                      // textColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

