import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userCtrl = TextEditingController();
  TextEditingController pin1Ctrl = TextEditingController();
  TextEditingController pin2Ctrl = TextEditingController();
  TextEditingController pin3Ctrl = TextEditingController();
  TextEditingController pin4Ctrl = TextEditingController();
  String errorMsg = '';

  @override
  Widget build(BuildContext context) {
    Text usernameLabel = Text('Username');
    SizedBox sizedBox = SizedBox(height: 10);

    InputDecoration userDec = InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Enter username',
    );

    TextField usernameField = TextField(
      controller: userCtrl,
      decoration: userDec,
    );


    Text pinLabel = Text('PIN');

    InputDecoration pinDec = InputDecoration(counterText: '');

    SizedBox pinField1 = SizedBox(
      width: 55,
      child: TextField(
        controller: pin1Ctrl,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: pinDec,
      ),
    );

    SizedBox pinField2 = SizedBox(
      width: 55,
      child: TextField(
        controller: pin2Ctrl,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: pinDec,
      ),
    );

    SizedBox pinField3 = SizedBox(
      width: 55,
      child: TextField(
        controller: pin3Ctrl,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: pinDec,
      ),
    );

    SizedBox pinField4 = SizedBox(
      width: 55,
      child: TextField(
        controller: pin4Ctrl,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: pinDec,
      ),
    );

    List<Widget> pinList = [pinField1, pinField2, pinField3, pinField4];
    Row pinRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: pinList,
    );

    Text loginText = Text('Login');
    ElevatedButton loginButton = ElevatedButton(
      onPressed: () {
        String username = userCtrl.text.trim();
        String pin = pin1Ctrl.text + pin2Ctrl.text + pin3Ctrl.text + pin4Ctrl.text;

        if (username == 'admin' && pin == '2121') {
          setState(() {
            errorMsg = '';
          });
          Navigator.pushNamed(context, '/welcome');
        } else {
          setState(() {
            errorMsg = 'Invalid username or PIN';
          });
        }
      },
      child: loginText,
    );

    Text errorText = Text(
      errorMsg,
      style: TextStyle(color: Colors.red),
      textAlign: TextAlign.center,
    );


    Text resetText = Text('Reset');
    OutlinedButton resetButton = OutlinedButton(
      onPressed: () {
        setState(() {
          userCtrl.clear();
          pin1Ctrl.clear();
          pin2Ctrl.clear();
          pin3Ctrl.clear();
          pin4Ctrl.clear();
          errorMsg = '';
        });
      },
      child: resetText,
    );

    List<Widget> bodyList = [
      usernameLabel,
      sizedBox,
      usernameField,
      sizedBox,
      pinLabel,
      sizedBox,
      pinRow,
      sizedBox,
      loginButton,
      sizedBox,
      errorText,
      sizedBox,
      resetButton,
    ];

    Column bodyColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: bodyList,
    );

    Padding bodyPadding = Padding(
      padding: EdgeInsets.all(20),
      child: bodyColumn,
    );

    Text appBarText = Text('Login');
    AppBar appBar = AppBar(title: appBarText);

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      body: bodyPadding,
    );

    return scaffold;
  }
}