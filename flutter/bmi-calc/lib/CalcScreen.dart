import 'package:flutter/material.dart';
import 'dart:math';

class CalcScreen extends StatefulWidget {
  @override
  createState() => CalcScreenState();
}

class CalcScreenState extends State<CalcScreen> {
  double _bmi;

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Height (cm)'),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Weight (kg)'),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: RaisedButton(
                onPressed: _onClick,
                child: Text('Calculate'),
              ),
            ),
            Text('Your BMI is $_bmi'),
            Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Image.asset('assets/bmi.jpg'))
          ],
        ),
      ),
    );
  }

  _onClick() {
    setState(() {
      _bmi = _calcBMI(
          height: (double.tryParse(_heightController.text.trim()) ?? 0.0) / 100,
          weight: double.tryParse(_weightController.text.trim()) ?? 0.0);
    });
    _initTextField();
  }

  double _calcBMI({double height, double weight}) => weight / pow(height, 2);

  _initTextField() {
    _heightController.clear();
    _weightController.clear();
  }
}
