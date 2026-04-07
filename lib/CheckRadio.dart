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

  String selectedState = "Gujarat";
  String selectedCity = "";

  Map<String, List<String>> data = {
    "Gujarat": ["Ahmedabad", "Surat", "Vadodara"],
    "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
    "Rajasthan": ["Jaipur", "Udaipur", "Jodhpur"]
  };

  @override
  Widget build(BuildContext context) {

    List<String> cities = data[selectedState]!;

    DropdownButton stateDropdown = DropdownButton(
      value: selectedState,
      items: data.keys.map((state) {
        return DropdownMenuItem(
          value: state,
          child: Text(state),
        );
      }).toList(),
      onChanged: (val) {
        setState(() {
          selectedState = val.toString();
          selectedCity = "";
        });
      },
    );

    Column cityRadios = Column(
      children: cities.map((city) {
        return RadioListTile(
          title: Text(city),
          value: city,
          groupValue: selectedCity,
          onChanged: (val) {
            setState(() {
              selectedCity = val.toString();
            });
          },
        );
      }).toList(),
    );

    Text resultText = Text("Selected City: $selectedCity");

    Column layout = Column(
      children: [
        stateDropdown,
        SizedBox(height: 10),
        cityRadios,
        SizedBox(height: 10),
        resultText,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("State & City")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}