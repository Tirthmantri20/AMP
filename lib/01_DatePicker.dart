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
  TextEditingController idController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  DateTime? selectedDate;

  bool flutter = false;
  bool java = false;
  bool dotnet = false;

  String getSkills() {
    List<String> skills = [];
    if (flutter) skills.add("Flutter");
    if (java) skills.add("Java");
    if (dotnet) skills.add(".NET");
    return skills.join(", ");
  }

  void pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void showData() {
    String id = idController.text;
    String dob = selectedDate != null
        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
        : "";

    String skills = getSkills();

    resultController.text =
    "Student Id: $id\nDate of Birth: $dob\nSkills: $skills";
  }

  @override
  Widget build(BuildContext context) {
    TextField studentIdField = TextField(
      controller: idController,
      decoration: InputDecoration(labelText: "Student Id"),
    );

    Row dateRow = Row(
      children: [
        Text(selectedDate == null
            ? "Select Date"
            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: pickDate,
        )
      ],
    );

    CheckboxListTile flutterBox = CheckboxListTile(
      title: Text("Flutter"),
      value: flutter,
      onChanged: (val) {
        setState(() {
          flutter = val!;
        });
      },
    );

    CheckboxListTile javaBox = CheckboxListTile(
      title: Text("Java"),
      value: java,
      onChanged: (val) {
        setState(() {
          java = val!;
        });
      },
    );

    CheckboxListTile dotnetBox = CheckboxListTile(
      title: Text(".NET"),
      value: dotnet,
      onChanged: (val) {
        setState(() {
          dotnet = val!;
        });
      },
    );

    ElevatedButton showButton = ElevatedButton(
      onPressed: showData,
      child: Text("Show"),
    );

    TextField resultField = TextField(
      controller: resultController,
      maxLines: 5,
      decoration: InputDecoration(labelText: "Result"),
    );

    Column layout = Column(
      children: [
        studentIdField,
        SizedBox(height: 10),
        dateRow,
        flutterBox,
        javaBox,
        dotnetBox,
        showButton,
        resultField,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Student Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}