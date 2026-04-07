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

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  List<int> numbers = [];
  
  @override
  Widget build(BuildContext context) {

      TextField startField = TextField(
        controller: startController,
        decoration: InputDecoration(labelText: "Start Number"),
      );

      TextField endField = TextField(
        controller: endController,
        decoration: InputDecoration(labelText: "End Number"),
      );

      ElevatedButton button = ElevatedButton(
        onPressed: (){
          int start = int.tryParse(startController.text) ?? 0;
          int end = int.tryParse(endController.text) ?? 0;

          List<int> temp = [];

          for (int i = start; i <= end; i++) {
            temp.add(i);
          }
          setState(() {
            numbers = temp;
          });
        },
        child: Text("Show Range"),
      );

      ListView listView = ListView.builder(
        shrinkWrap: true,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Text(numbers[index].toString());
        },
      );

      Column layout = Column(
        children: [
          startField,
          SizedBox(height: 10),
          endField,
          SizedBox(height: 10),
          button,
          SizedBox(height: 10),
          listView,
        ],
      );

      return Scaffold(
        appBar: AppBar(title: Text("Range App")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: layout,
        ),
      );
    }
  }
