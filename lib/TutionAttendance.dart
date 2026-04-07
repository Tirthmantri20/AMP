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

  DateTime? selectedDate;

  String subject = "Maths";

  List<String> maths = ["Vikas", "Rohan", "Tanisha", "Rucha", "Pavan"];
  List<String> science = ["Harsh", "Ved", "Vihan", "Chinar", "Dev"];

  Map<String, bool> attendance = {};

  String presentText = "";
  String absentText = "";

  int presentCount = 0;
  int absentCount = 0;

  @override
  Widget build(BuildContext context) {

    List<String> students = subject == "Maths" ? maths : science;

    // Initialize map
    for (var s in students) {
      attendance.putIfAbsent(s, () => false);
    }

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
              firstDate: now.add(Duration(days: -1)),
              lastDate: now
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

    Row subjectRow = Row(
      children: [
        Text("Subject: "),
        Radio(
          value: "Maths",
          groupValue: subject,
          onChanged: (val) {
            setState(() {
              subject = val.toString();
              attendance.clear();
            });
          },
        ),
        Text("Maths"),
        Radio(
          value: "Science",
          groupValue: subject,
          onChanged: (val) {
            setState(() {
              subject = val.toString();
              attendance.clear();
            });
          },
        ),
        Text("Science"),
      ],
    );

    ListView listView = ListView(
      shrinkWrap: true,
      children: students.map((s) {
        return CheckboxListTile(
          title: Text(s),
          value: attendance[s],
          onChanged: (val) {
            setState(() {
              attendance[s] = val!;
            });
          },
        );
      }).toList(),
    );

    ElevatedButton submitBtn = ElevatedButton(
      onPressed: () {

        List<String> present = [];
        List<String> absent = [];

        attendance.forEach((key, value) {
          if (value) {
            present.add(key);
          } else {
            absent.add(key);
          }
        });

        setState(() {
          presentText = present.join("\n");
          absentText = absent.join("\n");
          presentCount = present.length;
          absentCount = absent.length;
        });
      },
      child: Text("Submit"),
    );

    ElevatedButton resetBtn = ElevatedButton(
      onPressed: () {
        setState(() {
          attendance.updateAll((key, value) => false);
          presentText = "";
          absentText = "";
          presentCount = 0;
          absentCount = 0;
        });
      },
      child: Text("Reset"),
    );

    Row buttonRow = Row(
      children: [
        submitBtn,
        SizedBox(width: 10),
        resetBtn,
      ],
    );

    Row resultRow = Row(
      children: [
        Expanded(
          child: Text("Present ($presentCount):\n$presentText"),
        ),
        Expanded(
          child: Text("Absent ($absentCount):\n$absentText"),
        ),
      ],
    );

    Column layout = Column(
      children: [
        dateRow,
        subjectRow,
        listView,
        buttonRow,
        SizedBox(height: 10),
        resultRow,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Attendance App")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}