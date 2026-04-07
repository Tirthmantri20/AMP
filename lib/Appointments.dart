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

  DateTime? selectedDate = DateTime.now();

  String selectedSlot = "10 to 11";

  List<String> slots = [
    "10 to 11",
    "11 to 12",
    "12 to 1",
    "4 to 5",
    "5 to 6",
    "6 to 7"
  ];

  List<String> bookings = [];

  String message = "";

  @override
  Widget build(BuildContext context) {

    Row dateRow = Row(
      children: [
        Text(selectedDate == null
            ? "Select Date"
            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () async {

            DateTime now = DateTime.now();

            DateTime? date = await showDatePicker(
              context: context,
              initialDate: now,
              firstDate: now,
              lastDate: now,
            );

            if (date != null) {
              setState(() {
                selectedDate = date;
              });
            }
          },
        )
      ],
    );

    DropdownButton dropdown = DropdownButton(
      value: selectedSlot,
      items: slots.map((s) {
        return DropdownMenuItem(
          value: s,
          child: Text(s),
        );
      }).toList(),
      onChanged: (val) {
        setState(() {
          selectedSlot = val.toString();
        });
      },
    );

    ElevatedButton bookBtn = ElevatedButton(
      onPressed: () {

        if (selectedDate == null) return;

        String booking =
            "$selectedSlot";

        if (bookings.contains(booking)) {
          setState(() {
            message = "Slot not available";
          });
        } else {
          setState(() {
            bookings.add(booking);
            message = "";
          });
        }
      },
      child: Text("Book"),
    );

    ElevatedButton resetBtn = ElevatedButton(
      onPressed: () {
        setState(() {
          bookings.clear();
          message = "";
        });
      },
      child: Text("Reset"),
    );

    Row buttonRow = Row(
      children: [
        bookBtn,
        SizedBox(width: 10),
        resetBtn,
      ],
    );

    ListView listView = ListView.builder(
      shrinkWrap: true,
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return Text("Booked Time:" + bookings[index]);
      },
    );

    Text countText = Text("Total Bookings: ${bookings.length}");

    Text msgText = Text(message, style: TextStyle(color: Colors.red));

    Column layout = Column(
      children: [
        dateRow,
        dropdown,
        buttonRow,
        countText,
        listView,
        msgText,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Appointment Booking")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}