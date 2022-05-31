import 'package:flutter/material.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import '../custom_widget/RoundButton.dart';

// import '../constant.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'registration';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String Password;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(
        title: Text("ERDATA LOGIN PAGE"),
        appBar: AppBar(),
      ),
      drawer: const DrawerExtends(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FormBox('Enter username', false),
            SizedBox(
              height: 8.0,
            ),
            FormBox('Enter your password', true),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              onPressed: () {},
              text: 'Log in',
              color: Colors.teal.shade500,
            ),
            SizedBox(height: 10),
            RoundedButton(
              onPressed: () {},
              text: 'Sign Up Here',
              color: Colors.teal.shade500,
            ),
            SizedBox(height: 260),
            Footer(),
          ],
        ),
      ),
    );
  }

  TextField FormBox(String lable, bool isPassword) {
    return TextField(
      textAlign: TextAlign.center,
      obscureText: isPassword,
      onChanged: (value) {
        email = value;
      },
      decoration: kTextFileDecoration.copyWith(
        hintText: lable,
      ),
    );
  }
}
