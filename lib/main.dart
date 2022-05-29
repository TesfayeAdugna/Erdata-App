import 'package:flutter/material.dart';
import 'forms/children_registration.dart';
import 'forms/login.dart';
import 'forms/user_registration.dart';
import 'profile.dart';

import 'home.dart';
import 'profile.dart';
import 'child_donation.dart';
import 'home_sample.dart';

void main() {
  runApp(const profile());
}

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'profile first',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserRegistrationScreen(),
    );
  }
}
