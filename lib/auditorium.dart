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

  Map<String, String> seats = {};

  int totalBooked = 0;
  int totalEarning = 0;

  int getPrice(String seat) {
    if (seat.startsWith("A")) return 800;
    if (seat.startsWith("B")) return 600;
    return 500;
  }

  @override
  Widget build(BuildContext context) {

    List<String> seatNames = [];

    for (var row in ["A", "B", "C"]) {
      for (int i = 1; i <= 5; i++) {
        seatNames.add("$row$i");
        seats.putIfAbsent("$row$i", () => "normal");
      }
    }

    List<Widget> seatWidgets = [];

    seatNames.forEach((seat) {

      Color color = Colors.grey;

      if (seats[seat] == "booked") color = Colors.red;
      if (seats[seat] == "selected") color = Colors.blue;
      if (seats[seat] == "release") color = Colors.yellow;

      GestureDetector seatBox = GestureDetector(
        onTap: () {
          setState(() {
            if (seats[seat] == "booked") {
              seats[seat] = "release"; // yellow
            } else {
              if(seats[seat] == "selected"){
                seats[seat] = "normal";
              }else{
                seats[seat] = "selected";
              }
            }
          });
        },
        child: Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(10),
          color: color,
          child: Text(seat),
        ),
      );

      seatWidgets.add(seatBox);
    });

    ElevatedButton bookBtn = ElevatedButton(
      onPressed: () {

        setState(() {
          seats.forEach((seat, status) {
            if (status == "selected") {
              seats[seat] = "booked";
              totalBooked++;
              totalEarning += getPrice(seat);
            }
          });
        });
      },
      child: Text("Book"),
    );

    ElevatedButton releaseBtn = ElevatedButton(
      onPressed: () {

        setState(() {
          seats.forEach((seat, status) {
            if (status == "release") {
              seats[seat] = "normal";
              totalBooked--;
              totalEarning -= getPrice(seat);
            }
          });
        });
      },
      child: Text("Release"),
    );

    Row buttonRow = Row(
      children: [
        bookBtn,
        SizedBox(width: 10),
        releaseBtn,
      ],
    );

    int totalAvailable = 15 - totalBooked;

    Column layout = Column(
      children: [
        Wrap(children: seatWidgets),
        buttonRow,
        Text("Booked: $totalBooked"),
        Text("Available: $totalAvailable"),
        Text("Total Earning: ₹$totalEarning"),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Seat Booking")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}