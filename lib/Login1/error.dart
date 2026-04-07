import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ElevatedButton tryAgainBtn = ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Try Again"),
    );

    Column layout = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Invalid Credentials"),
        SizedBox(height: 10),
        tryAgainBtn,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Error")),
      body: Center(child: layout),
    );
  }
}