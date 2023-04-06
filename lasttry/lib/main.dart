import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dice App',
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  List<int> diceValues = [1, 1]; // start with two dice
  Random random = Random();

  void rollDice() {
    setState(() {
      diceValues =
          List.generate(diceValues.length, (index) => random.nextInt(6) + 1);
    });
  }

  void addDice() {
    setState(() {
      diceValues.add(random.nextInt(6) + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dice Values:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              diceValues.map((value) => _buildDiceImage(value)).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: rollDice,
              child: const Text('Roll Dice'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: addDice,
              child: const Text('Add Dice'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiceImage(int value) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        'images/dice$value.png',
        width: 100,
        height: 100,
      ),
    );
  }
}