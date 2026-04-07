import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Text welcomeText = Text(
      "Welcome",
      style: TextStyle(fontSize: 25),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(child: welcomeText),
    );
  }
}