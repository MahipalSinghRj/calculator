import 'package:flutter/material.dart';

import 'my_buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  double answer = 0.0;

  // List of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //AppBar
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userInput,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                          (answer == 0) ? "0" : "$answer",
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      // Clear Button
                      if (index == 0) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput = '';
                              answer = 0;
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[50],
                          textColor: Colors.red,
                        );
                      }
                      // +/- button
                      else if (index == 1) {
                        return MyButton(
                          buttonText: buttons[index],
                          color: Colors.blue[50],
                          textColor: Colors.black,
                        );
                      }
                      // % Button
                      else if (index == 2) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              if (userInput.isEmpty) {
                                var mode = buttons[index];

                                if (mode.contains('%')) {
                                  userInput = '';
                                } else {
                                  userInput = userInput + buttons[index];
                                }
                              } else {
                                userInput = userInput + buttons[index];
                              }
                            });
                          },

                          buttonText: buttons[index],
                          color: Colors.blue[50],
                          textColor: Colors.black,
                        );
                      }
                      // Delete Button
                      else if (index == 3) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[50],
                          textColor: Colors.green,
                        );
                      }
                      // Equal_to Button
                      else if (index == 18) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              calculateNum();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.orange[700],
                          textColor: Colors.white,
                        );
                      }
                      //  other buttons
                      else {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              if (userInput.isEmpty) {
                                var btnVal = buttons[index];

                                if (
                                    btnVal.contains("+") ||
                                    btnVal.contains("-") ||
                                    btnVal.contains("x") ||
                                    btnVal.contains("/")) {
                                  setState(() {
                                    userInput = "";
                                  });
                                } else {
                                  userInput = userInput + buttons[index];
                                }
                              } else {
                                userInput = userInput + buttons[index];
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueAccent
                              : Colors.grey,
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black,
                        );
                      }
                    }), // GridView.builder
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculateNum() {
    var x = userInput;

    print("User Input : $userInput");

    try {
      if (x.contains("+")) {
        print("Add Method");
        final split = userInput.split('+');
        for (int i = 0; i < split.length; i++) {
          answer = answer + double.parse(split[i]);
        }
        /* double v1 = double.parse(split[0]);
         double v2 = double.parse(split[1]);
         answer = v1 + v2;*/
        print("Add result : $answer");
      } else if (x.contains("-")) {
        print("Substract Method");
        final split = userInput.split('-');
        /*double v1 = double.parse(split[0]);
        double v2 = double.parse(split[1]);
        answer = v1 - v2;*/
        for (int i = 0; i < split.length; i++) {
          var sub=answer;
          print("Value : ${double.parse(split[i])}");
          // var y = (double.parse(split[i] )- double.parse(split[i-1]));
          //  print("Result y : $y");
          answer = sub + (double.parse(split[0])-double.parse(split[i+1]));
        }

        print("answer : ${answer}");
      } else if (x.contains("x")) {
        print("Multiple Method");
        final split = userInput.split('x');
        double v1 = double.parse(split[0]);
        double v2 = double.parse(split[1]);
        answer = v1 * v2;
        print("Multiple result : $answer");
      } else if (x.contains("/")) {
        print("Divide Method");
        final split = userInput.split('/');
        double v1 = double.parse(split[0]);
        double v2 = double.parse(split[1]);
        answer = v1 / v2;
        print("Divide result : $answer");
      } else if (x.contains("%")) {
        print("Mode Method");
        final split = userInput.split('%');
        double v1 = double.parse(split[0]);
        double v2 = double.parse(split[1]);
        answer = (v1 * v2) / 100;
        print("Percentage result : $answer");
      } else if (x.contains("+/-")) {
        print("+/- Method");
        final split = userInput.split('+/-');
        double v1 = double.parse(split[0]);
        double v2 = double.parse(split[1]);
        if (x.contains('+')) {
          -v1 == v1;
        } else if (x.contains('-')) {
          v1 == -v1;
        }
        answer = v1 + v2;
        print("plus/minus result : $answer");
      }
    } catch (e) {
      e.toString();
    }
  }
}
