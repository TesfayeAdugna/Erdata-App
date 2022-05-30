import 'package:flutter/material.dart';
import '../custom_widget/RoundButton.dart';

import '../constant.dart';

class ChildrenRegistrationScreen extends StatefulWidget {
  static String id = 'registration';
  @override
  _ChildrenRegistrationScreenState createState() =>
      _ChildrenRegistrationScreenState();
}

class _ChildrenRegistrationScreenState
    extends State<ChildrenRegistrationScreen> {
  late String email;
  late String Password;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              FormBox('first name'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('last name'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('gender'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('brithdate'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('kebele'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('woreda'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('zone'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('region'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('photo'),
              SizedBox(
                height: 22.0,
              ),
              FormBox('description'),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                onPressed: () {},
                text: 'Register',
                color: Colors.teal.shade500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField FormBox(String lable) {
    return TextField(
        textAlign: TextAlign.center,
        onChanged: (value) {
          email = value;
        },
        decoration: kTextFileDecoration.copyWith(
          hintText: lable,
        ));
  }
}
