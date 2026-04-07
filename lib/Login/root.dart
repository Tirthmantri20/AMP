import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'welcome.dart';

void main() {
  // Root widget variable
  const Root root = Root();
  runApp(root);
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp variable
    MaterialApp app = MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/welcome': (context) => const WelcomePage(),
      },
      debugShowCheckedModeBanner: false,
    );

    return app;
  }
}
