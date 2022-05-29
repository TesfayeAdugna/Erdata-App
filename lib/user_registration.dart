import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../custom_widget/RoundButton.dart';
import '../custom_widget/drawers.dart';
import '../constant.dart';

class UserRegistrationScreen extends StatefulWidget {
  static String id = 'registration';
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  late String email;
  late String Password;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FormBox('Enter username', false),
            SizedBox(
              height: 22.0,
            ),
            FormBox('Enter your email', false),
            SizedBox(
              height: 22.0,
            ),
            FormBox('Enter first name', false),
            SizedBox(
              height: 22.0,
            ),
            FormBox('Enter last name', false),
            SizedBox(
              height: 22.0,
            ),
            FormBox('Enter your password', true),
            SizedBox(
              height: 24.0,
            ),
            FormBox('confirm password', true),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              onPressed: () {
                context.go('/');
              },
              text: 'Register',
              color: Colors.teal.shade500,
            ),
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
