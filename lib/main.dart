import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

int getRandomDiceValue() => Random().nextInt(6) + 1;

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = getRandomDiceValue();
  int rightDiceNumber = getRandomDiceValue();

  void changeDiceValues() => setState(() {
        leftDiceNumber = getRandomDiceValue();
        rightDiceNumber = getRandomDiceValue();
      });

  // render dice widget
  Widget getDice(bool left) => TextButton(
        onPressed: changeDiceValues,
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Image.asset(
            'assets/images/dice${left ? leftDiceNumber : rightDiceNumber}.png',
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: getDice(true)), // left dice
              Expanded(child: getDice(false)) // right dice
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '${leftDiceNumber + rightDiceNumber}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
              ),
            ),
          )
        ],
      ),
    );
  }
}
