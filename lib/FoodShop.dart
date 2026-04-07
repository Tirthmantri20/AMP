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

  Map<String, int> stock = {
    "Breakfast": 30,
    "Lunch": 40,
    "Dinner": 30
  };

  Map<String, int> price = {
    "Breakfast": 40,
    "Lunch": 80,
    "Dinner": 60
  };

  Map<String, int> sold = {
    "Breakfast": 0,
    "Lunch": 0,
    "Dinner": 0
  };

  Map<String, int> selectedQty = {
    "Breakfast": 1,
    "Lunch": 1,
    "Dinner": 1
  };

  int totalTarget = (30 * 40) + (40 * 80) + (30 * 60);
  int totalAchieved = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> itemWidgets = [];

    stock.forEach((item, qty) {

      int remaining = stock[item]! - sold[item]!;
      int unitPrice = price[item]!;
      int qtySelected = selectedQty[item]!;

      int totalPrice = unitPrice * qtySelected;

      List<int> dropdownValues = [];
      for (int i = 1; i <= 5; i++) {
        if (i <= remaining) {
          dropdownValues.add(i);
        }
      }

      DropdownButton dropdown = DropdownButton(
        value: qtySelected,
        items: dropdownValues.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.toString()),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            selectedQty[item] = val as int;
          });
        },
      );

      ElevatedButton orderBtn = ElevatedButton(
        onPressed: remaining == 0 ? null : () {

          setState(() {
            sold[item] = sold[item]! + selectedQty[item]!;
            totalAchieved += selectedQty[item]! * unitPrice;
          });
        },
        child: Text("Place Order"),
      );

      Column itemColumn = Column(
        children: [
          Text(item),
          dropdown,
          Text("Total Price: $totalPrice"),
          orderBtn,
          Text("Sold: ${sold[item]}"),
          Text("Remaining: $remaining"),
          SizedBox(height: 10),
        ],
      );

      itemWidgets.add(itemColumn);
    });

    int remainingAmount = totalTarget - totalAchieved;

    Column layout = Column(
      children: [
        ...itemWidgets,
        Text("Target: $totalTarget"),
        Text("Achieved: $totalAchieved"),
        Text("Remaining: $remainingAmount"),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Food Sales")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}