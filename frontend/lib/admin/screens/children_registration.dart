import 'package:flutter/material.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import '../../custom_widget/RoundButton.dart';

// import '../constant.dart';

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
      appBar: HeaderBar(
        title: "CHILD REGISTRATION",
        appBar: AppBar(),
      ),
      drawer: const DrawerExtends(
        color: Colors.black,
      ),
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

  TextFormField FormBox(String label) {
    return TextFormField(
        decoration:
            InputDecoration(hintText: label, border: UnderlineInputBorder()),
        validator: (String? username) {
          if (username == null || username.isEmpty) {
            return "Image should not be empty";
          }
        });
  }
}
