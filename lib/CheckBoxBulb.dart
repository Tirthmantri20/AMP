import 'package:flutter/material.dart';

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

  bool hall = false;
  bool kitchen = false;
  bool bedroom = false;
  bool lobby = false;

  @override
  Widget build(BuildContext context) {

    CheckboxListTile hallBox = CheckboxListTile(
      title: Text("Hall"),
      value: hall,
      onChanged: (val) {
        setState(() {
          hall = val!;
        });
      },
    );

    CheckboxListTile kitchenBox = CheckboxListTile(
      title: Text("Kitchen"),
      value: kitchen,
      onChanged: (val) {
        setState(() {
          kitchen = val!;
        });
      },
    );

    CheckboxListTile bedroomBox = CheckboxListTile(
      title: Text("Bedroom"),
      value: bedroom,
      onChanged: (val) {
        setState(() {
          bedroom = val!;
        });
      },
    );

    CheckboxListTile lobbyBox = CheckboxListTile(
      title: Text("Lobby"),
      value: lobby,
      onChanged: (val) {
        setState(() {
          lobby = val!;
        });
      },
    );

    Row bulbRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.lightbulb, size: 40, color: hall ? Colors.yellow : Colors.grey),
        Icon(Icons.lightbulb, size: 40, color: kitchen ? Colors.yellow : Colors.grey),
        Icon(Icons.lightbulb, size: 40, color: bedroom ? Colors.yellow : Colors.grey),
        Icon(Icons.lightbulb, size: 40, color: lobby ? Colors.yellow : Colors.grey),
      ],
    );

    Column layout = Column(
      children: [
        hallBox,
        kitchenBox,
        bedroomBox,
        lobbyBox,
        SizedBox(height: 20),
        bulbRow,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Bulb Control")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}