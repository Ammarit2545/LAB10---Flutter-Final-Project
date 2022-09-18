import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(LAB7());
}

class LAB7 extends StatefulWidget {
  const LAB7({Key key}) : super(key: key);

  @override
  State<LAB7> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LAB7> {
  String result = "0", expression = "";

  buttonPressed(String value) {
    ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.purple,
    );
    print(value);

    setState(() {
      if (value == "CLEAR") {
        result = "0";
      } else if (value == "π") {
        expression = result.replaceAll("X", "*");
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = exp.evaluate(EvaluationType.REAL, cm) * (22 / 7);

        result = "$calculate";
      } else if (value == "Tri") {
        expression = result.replaceAll("X", "*");
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = (exp.evaluate(EvaluationType.REAL, cm) *
                exp.evaluate(EvaluationType.REAL, cm)) *
            (1.732 / 4);

        result = "$calculate";
      } else if (value == "Sqr") {
        expression = result.replaceAll("X", "*");
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = (exp.evaluate(EvaluationType.REAL, cm) *
            exp.evaluate(EvaluationType.REAL, cm));

        result = "$calculate";
      } else if (value == "Circle") {
        expression = result.replaceAll("X", "*");
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = (exp.evaluate(EvaluationType.REAL, cm) *
                exp.evaluate(EvaluationType.REAL, cm)) *
            (22 / 7);

        result = "$calculate";
      } else if (value == ".") {
        if (result.contains(".")) {
          return;
        } else {
          result = result + value;
        }
      } else if (value == "sin") {
      } else if (result == "Infinity") {
        value == "CLEAR";
      } else if (value == "=") {
        expression = result.replaceAll("X", "*");
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = exp.evaluate(EvaluationType.REAL, cm);

        result = "$calculate";
      } else {
        if (result == "0") {
          result = value;
        } else {
          result = result + value;
        }
      }
    });
  }

  Widget myButton(String buttonLabel) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonLabel),
        child: Text(
          buttonLabel,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      myButton("7"),
                      myButton("8"),
                      myButton("9"),
                      myButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("4"),
                      myButton("5"),
                      myButton("6"),
                      myButton("X"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("1"),
                      myButton("2"),
                      myButton("3"),
                      myButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("."),
                      myButton("0"),
                      myButton("00"),
                      myButton("+"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("CLEAR"),
                      myButton("="),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("π"),
                      myButton("Tri"),
                      myButton("Sqr"),
                      myButton("Circle"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
