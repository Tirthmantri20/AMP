import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double a = 1;
  double b = 1;
  double c = 1;

  String result = "";

  void showMax() {
    double maxVal = a;

    if (b > maxVal) maxVal = b;
    if (c > maxVal) maxVal = c;

    setState(() {
      result = "Max Value: ${maxVal.toInt()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    Slider sliderA = Slider(
      value: a,
      min: 1,
      max: 5,
      divisions: 4,
      label: a.toString(),
      onChanged: (val) {
        setState(() {
          a = val;
        });
      },
    );

    Slider sliderB = Slider(
      value: b,
      min: 1,
      max: 5,
      divisions: 4,
      label: b.toString(),
      onChanged: (val) {
        setState(() {
          b = val;
        });
      },
    );

    Slider sliderC = Slider(
      value: c,
      min: 1,
      max: 5,
      divisions: 4,
      label: c.toString(),
      onChanged: (val) {
        setState(() {
          c = val;
        });
      },
    );

    ElevatedButton button = ElevatedButton(
      onPressed: showMax,
      child: Text("Show Max"),
    );

    Text resultText = Text(result, style: TextStyle(fontSize: 18));

    Column layout = Column(
      children: [
        Text("A: ${a.toInt()}"),
        sliderA,
        Text("B: ${b.toInt()}"),
        sliderB,
        Text("C: ${c.toInt()}"),
        sliderC,
        button,
        resultText,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Find Max")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}