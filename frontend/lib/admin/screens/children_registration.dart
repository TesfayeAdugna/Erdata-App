import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/erdata/blocs/blocs.dart';
import 'package:sec_2/erdata/models/children_model.dart';

import '../../custom_widget/custom_widgets.dart';

// import '../constant.dart';

class ChildrenRegistrationScreen extends StatefulWidget {
  static String id = 'registration';
  @override
  _ChildrenRegistrationScreenState createState() =>
      _ChildrenRegistrationScreenState();
}

class _ChildrenRegistrationScreenState
    extends State<ChildrenRegistrationScreen> {
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
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'please enter gender';
                      }
                      var check = value.toString();
                      print(check);
                      if ((check.compareTo("male") == 0) ||
                          (check.compareTo("female") == 0)) {
                        return null;
                      }
                      return 'gender must be "male" or "female"';
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'enter gender',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["gender"] = value;
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'enter age';
                      }
                      if (double.tryParse(value!) == null) {
                        return 'The input is not a numeric string';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'age',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["age"] = int.parse(value!);
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'enter description';
                      }
                      final validdescription = value!.length > 20;
                      return validdescription
                          ? null
                          : "Desctiption length must be > 20";
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'enter description',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["description"] = value;
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'please enter kebele';
                      }

                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'enter kebele',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["kebele"] = value;
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'please enter woreda';
                      }

                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'enter woreda',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["woreda"] = value;
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'please enter zone';
                      }

                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'enter zone',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["zone"] = value;
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'please enter region';
                      }

                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'enter region',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["region"] = value;
                      });
                    }),
                BlocConsumer<ChildrenBloc, ChildrenState>(
                  listener: (context, state) {
                    if (state is ChildrenOperationSuccess) {
                      return context.goNamed("home");
                    }
                  },
                  builder: (context, state) {
                    if (state is ChildrenOperationSuccess) {
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
                      final ChildrenEvent event = ChildrenCreate(Children(
                        first_name: _register["first_name"],
                        last_name: _register["last_name"],
                        gender: _register["gender"],
                        age: _register["age"],
                        description: _register["description"],
                        kebele: _register["kebele"],
                        woreda: _register["woreda"],
                        zone: _register["zone"],
                        region: _register["region"],
                      ));
                      BlocProvider.of<ChildrenBloc>(context).add(event);
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
