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

  bool selectAll = false;
  bool pizza = false;
  bool fries = false;
  bool drink = false;

  @override
  Widget build(BuildContext context) {

    int total = 0;
    List<String> items = [];

    if (pizza) {
      total += 250;
      items.add("Pizza");
    }

    if (fries) {
      total += 80;
      items.add("French Fries");
    }

    if (drink) {
      total += 50;
      items.add("Cold Drink");
    }

    CheckboxListTile selectAllBox = CheckboxListTile(
      title: Text("Select All"),
      value: selectAll,
      onChanged: (val) {
        setState(() {
          selectAll = val!;
          pizza = val;
          fries = val;
          drink = val;
        });
      },
    );

    CheckboxListTile pizzaBox = CheckboxListTile(
      title: Text("Pizza (₹250)"),
      value: pizza,
      onChanged: (val) {
        setState(() {
          pizza = val!;
          selectAll = pizza && fries && drink;
        });
      },
    );

    CheckboxListTile friesBox = CheckboxListTile(
      title: Text("French Fries (₹80)"),
      value: fries,
      onChanged: (val) {
        setState(() {
          fries = val!;
          selectAll = pizza && fries && drink;
        });
      },
    );

    CheckboxListTile drinkBox = CheckboxListTile(
      title: Text("Cold Drink (₹50)"),
      value: drink,
      onChanged: (val) {
        setState(() {
          drink = val!;
          selectAll = pizza && fries && drink;
        });
      },
    );

    Text itemsText = Text("Selected: ${items.join(", ")}");

    Text totalText = Text("Total Price: ₹$total");

    Column layout = Column(
      children: [
        selectAllBox,
        pizzaBox,
        friesBox,
        drinkBox,
        SizedBox(height: 10),
        itemsText,
        totalText,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Food Selection")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}