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

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  String gender = "Male";

  bool english = true;
  bool gujarati = false;
  bool hindi = false;

  String result = "";

  @override
  Widget build(BuildContext context) {

    TextField firstField = TextField(
      controller: firstController,
      decoration: InputDecoration(labelText: "First Name"),
    );

    TextField lastField = TextField(
      controller: lastController,
      decoration: InputDecoration(labelText: "Last Name"),
    );

    Row genderRow = Row(
      children: [
        Radio(
          value: "Male",
          groupValue: gender,
          onChanged: (val) {
            setState(() {
              gender = val.toString();
            });
          },
        ),
        Text("Male"),
        Radio(
          value: "Female",
          groupValue: gender,
          onChanged: (val) {
            setState(() {
              gender = val.toString();
            });
          },
        ),
        Text("Female"),
        Radio(
          value: "Other",
          groupValue: gender,
          onChanged: (val) {
            setState(() {
              gender = val.toString();
            });
          },
        ),
        Text("Other"),
      ],
    );

    CheckboxListTile engBox = CheckboxListTile(
      title: Text("English"),
      value: english,
      onChanged: (val) {
        setState(() {
          english = val!;
        });
      },
    );

    CheckboxListTile gujBox = CheckboxListTile(
      title: Text("Gujarati"),
      value: gujarati,
      onChanged: (val) {
        setState(() {
          gujarati = val!;
        });
      },
    );

    CheckboxListTile hinBox = CheckboxListTile(
      title: Text("Hindi"),
      value: hindi,
      onChanged: (val) {
        setState(() {
          hindi = val!;
        });
      },
    );

    ElevatedButton registerBtn = ElevatedButton(
      onPressed: () {

        List<String> langs = [];
        if (english) langs.add("English");
        if (gujarati) langs.add("Gujarati");
        if (hindi) langs.add("Hindi");

        setState(() {
          result =
          "Name: ${firstController.text} ${lastController.text}\n"
              "Gender: $gender\n"
              "Languages: ${langs.join(", ")}";
        });
      },
      child: Text("Register"),
    );

    Text resultText = Text(result);

    Column layout = Column(
      children: [
        firstField,
        SizedBox(height: 10),
        lastField,
        SizedBox(height: 10),
        genderRow,
        engBox,
        gujBox,
        hinBox,
        registerBtn,
        SizedBox(height: 10),
        resultText,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}