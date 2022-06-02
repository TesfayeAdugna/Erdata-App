import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';

class UserRegistrationScreen extends StatelessWidget {
  UserRegistrationScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
   final usernameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
            appBar: AppBar(
              title: Text("ERDATA"),
              centerTitle: true,
            ),
            drawer: DrawerExtends(),
            body: Padding(
              padding: EdgeInsets.only(left: 70, right: 70, top: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        child: Image(
                          image: AssetImage("assets/logo3.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email", border: UnderlineInputBorder()),
                        validator: (String? email) {
                          if (email == null || email.isEmpty) {
                            return "Email field must not be empty";
                          }
                          final validEmail =
                              RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
                          final correct = validEmail.hasMatch(email);

                          return correct ? null : "Enter a valid email";
                        }),
                    SizedBox(height: 15),
                    TextFormField(
                        controller: firstnameController,
                        decoration: InputDecoration(
                            hintText: "First Name",
                            border: UnderlineInputBorder()),
                        validator: (String? firstname) {
                          if (firstname == null || firstname.isEmpty) {
                            return "First Name field must not be empty";
                          }
                        }),
                        SizedBox(height: 15),
                    TextFormField(
                        controller: lastnameController,
                        decoration: InputDecoration(
                            hintText: "Last Name",
                            border: UnderlineInputBorder()),
                        validator: (String? lastname) {
                          if (lastname == null || lastname.isEmpty) {
                            return "Last Name field must not be empty";
                          }
                        }),
                    SizedBox(height: 15),
                    TextFormField(
                        controller: lastnameController,
                        decoration: InputDecoration(
                            hintText: "Create username",
                            border: UnderlineInputBorder()),
                        validator: (String? username) {
                          if (username == null || username.isEmpty) {
                            return "Username field must not be empty";
                          }
                          final validname = username.length > 3;
                          return validname
                              ? null
                              : "Username should be greater than 3";
                        }),
                    SizedBox(height: 15),
                    TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: UnderlineInputBorder()),
                        validator: (String? password) {
                          if (password == null || password.isEmpty) {
                            return "Password cannot be empty";
                          }
                          final validname = password.length > 6;
                          return validname
                              ? null
                              : "Password should be atleast 6 characters";
                        }),
                    SizedBox(height: 15),
                    TextFormField(
                        controller: confirmpassController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: UnderlineInputBorder()),
                        validator: (String? password2) {
                          if (password2 == null || password2.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (passwordController.text !=
                              confirmpassController.text) {
                            return "Not maching password";
                          }
                          final validname = password2.length > 6;
                          return validname
                              ? null
                              : "Password should be atleast 6 characters";
                        }),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final formValid = formKey.currentState!.validate();
                        if (!formValid) return;
                        return context.go('/');
                      },
                      child: Text(
                        "SIGNUP",
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 50),
                        maximumSize: const Size(100, 50),
                        primary: Colors.brown,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
