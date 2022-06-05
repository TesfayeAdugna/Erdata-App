import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/account/blocs/blocs.dart';
import 'package:sec_2/account/blocs/registration_state.dart';
import 'package:sec_2/account/data_providers/data_providers.dart';
import 'package:sec_2/account/models/model.dart';
import 'package:sec_2/account/repository/registration_repository.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:sec_2/home.dart';
import 'package:sec_2/custom_widget/RoundButton.dart';

// import '../constant.dart';

class UserRegistrationScreen extends StatefulWidget {
  static String id = 'registration';
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  dynamic validate;
  String change = 'Register';
  final Map<String, dynamic> _register = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(
        title: "ERDATA USER REGISTRATION",
        appBar: AppBar(),
      ),
      drawer: const DrawerExtends(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 22.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter Enter username';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'Enter username',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["username"] = value;
                      });
                    }),
                SizedBox(
                  height: 22.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please Enter your email';
                      }
                      final validEmail =
                          RegExp("[A-Za-z0-9]@[A-Za-z0-9].[A-Za-z]");
                      final correct = validEmail.hasMatch(value!);
                      return correct ? null : "Enter a valid email";
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'Enter Email',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["email"] = value;
                      });
                    }),
                SizedBox(
                  height: 22.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please Enter first name';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'first name',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["first_name"] = value;
                      });
                    }),
                SizedBox(
                  height: 22.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please Enter last name';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'last name',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["last_name"] = value;
                      });
                    }),
                SizedBox(
                  height: 22.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      validate = value;
                      final validPassword = value!.length >= 7;
                      return validPassword
                          ? null
                          : "Password length must be > 6";
                    },
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'password',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["password"] = value;
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'confirm Password must not be null';
                      }

                      final validEmail = value;
                      final correct = value == validate;
                      return correct
                          ? null
                          : "password and confirm password must be similar.";
                    },
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'confirm password',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["password2"] = value;
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                BlocConsumer<RegistrationBloc, RegistrationState>(
                  listener: (context, state) {
                    if (state is RegistrationOperationFailure) {
                      return context.goNamed("home");
                    }
                  },
                  builder: (context, state) {
                    if (state is RegistrationOperationSuccess) {
                      change = "succesfully registered";
                      return Text('');
                    }
                    return Text('');
                  },
                ),
                RoundedButton(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final RegistrationEvent event = RegistrationCreate(
                        Registration(
                            username: _register["username"],
                            email: _register["email"],
                            first_name: _register["first_name"],
                            last_name: _register["last_name"],
                            password2: _register["password2"],
                            password: _register["password"]),
                      );
                      BlocProvider.of<RegistrationBloc>(context).add(event);
                    }
                  },
                  text: change,
                  color: Colors.teal.shade500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
