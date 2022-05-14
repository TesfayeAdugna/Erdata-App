import 'package:flutter/material.dart';
<<<<<<< Updated upstream

=======
import 'child_donation.dart';
import 'home_sample.dart';
import 'login.dart';
import 'login_form.dart';
>>>>>>> Stashed changes
import 'home.dart';

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
      home: HomePage(),
    );
  }
}