import 'package:flutter/material.dart';
import 'welcome.dart';
import 'error.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextField usernameField = TextField(
      controller: userController,
      decoration: InputDecoration(labelText: "Username"),
    );

    TextField passwordField = TextField(
      controller: passController,
      decoration: InputDecoration(labelText: "Password"),
      obscureText: true,
    );

    ElevatedButton loginBtn = ElevatedButton(
      onPressed: () {

        String user = userController.text;
        String pass = passController.text;

        if (user == "admin" && pass == "admin") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ErrorScreen()),
          );
        }
      },
      child: Text("Login"),
    );

    Column layout = Column(
      children: [
        usernameField,
        SizedBox(height: 10),
        passwordField,
        SizedBox(height: 10),
        loginBtn,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: layout,
      ),
    );
  }
}