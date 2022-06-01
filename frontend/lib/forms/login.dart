import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
            appBar: AppBar(
              title: Text("ERDATA"),
              centerTitle: true,
            ),
            body: Padding(
              padding:
                  EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 50),
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
                    Text(
                      "ERDATA",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 60),
                    TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            hintText: "Username",
                            border: UnderlineInputBorder()),
                        validator: (String? username) {
                          if (username == null || username.isEmpty) {
                            return "Username must not be empty";
                          }
                          final validname = username.length > 3;
                          return validname
                              ? null
                              : "Username should be greater than 3";
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: UnderlineInputBorder()),
                        validator: (String? username) {
                          if (username == null || username.isEmpty) {
                            return "Password cannot be empty";
                          }
                          final validname = username.length > 3;
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
                        "LOGIN",
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        maximumSize: const Size(200, 50),
                        primary: Colors.brown,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final formValid = formKey.currentState!.validate();
                        if (!formValid) return;
                      },
                      child: Text(
                        "SIGNUP",
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        maximumSize: const Size(200, 50),
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
