import 'package:flutter/material.dart';
import '../custom_widget/RoundButton.dart';

import '../constant.dart';
import '../custom_widget/drawers.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Color.fromARGB(255, 25, 6, 133),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
              ),
              Row(
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    iconSize: 200.0,
                    padding: EdgeInsets.all(5.0),
                    icon: ClipRRect(
                      child: Image.asset("assets/logo2.jpg"),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                alignment: Alignment.center,
                iconSize: 50.0,
                padding: EdgeInsets.all(10.0),
                icon: ClipRRect(
                  child: Image.asset("assets/profile_image2.jpg"),
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {},
              ),
            ],
          ),
    ),
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
          ],
        ),
      ),
      drawer: const DrawerExtends(
          color: Colors.black,
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
