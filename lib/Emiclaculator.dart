import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double loan = 50000;
  double rate = 8;
  double years = 1;

  @override
  Widget build(BuildContext context) {

    double monthlyRate = rate / 12 / 100;
    int months = (years * 12).toInt();

    double emi = (loan * monthlyRate * pow(1 + monthlyRate, months)) /
        (pow(1 + monthlyRate, months) - 1);

    Slider loanSlider = Slider(
      value: loan,
      min: 50000,
      max: 500000,
      divisions: 9,
      label: loan.toInt().toString(),
      onChanged: (val) {
        setState(() {
          loan = val;
        });
      },
    );

    Slider rateSlider = Slider(
      value: rate,
      min: 8,
      max: 12,
      divisions: 4,
      label: rate.toString(),
      onChanged: (val) {
        setState(() {
          rate = val;
        });
      },
    );

    Slider yearSlider = Slider(
      value: years,
      min: 0,
      max: 10,
      divisions: 10,
      label: years.toString(),
      onChanged: (val) {
        setState(() {
          years = val;
        });
      },
    );

    Column layout = Column(
      children: [
        Text("Loan: ₹${loan.toInt()}"),
        loanSlider,
        Text("Interest: ${rate.toStringAsFixed(1)}%"),
        rateSlider,
        Text("Years: ${years.toInt()}"),
        yearSlider,
        SizedBox(height: 20),
        Text("EMI: ₹${emi.toStringAsFixed(2)}"),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("EMI Calculator")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}