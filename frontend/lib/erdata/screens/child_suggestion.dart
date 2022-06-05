import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/erdata/blocs/blocs.dart';
import 'package:sec_2/erdata/models/model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:image_picker/image_picker.dart';

class ChildSuggestion extends StatefulWidget {
  static String id = 'registration';

  @override
  _ChildSuggestionState createState() => _ChildSuggestionState();
}

class _ChildSuggestionState extends State<ChildSuggestion> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  late final PickedFile _image = PickedFile("assets/logo3.jpg");
  final _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  String change = 'suggest';
  final List<String> gender = ['Female', 'Male'];
  final Map<String, dynamic> _register = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: HeaderBar(
        title: "ERDATA CHILDREN SUGGESTION",
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
                        return 'Please enter Enter child name';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFileDecoration.copyWith(
                      hintText: 'Enter child name',
                    ),
                    onSaved: (value) {
                      setState(() {
                        _register["child_name"] = value;
                      });
                    }),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'please enter gender';
                      }
                      var check = value.toString();
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
                BlocConsumer<SuggestionBloc, SuggestionState>(
                  listener: (context, state) {
                    if (state is SuggestionOperationSuccess) {
                      return context.goNamed("home");
                    }
                  },
                  builder: (context, state) {
                    if (state is SuggestionOperationSuccess) {
                      change = "succesfully suggested";
                      return Text('');
                    }
                    return Text('');
                  },
                ),
                SizedBox(height: 10),
                RoundedButton(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final SuggestionEvent event = SuggestionCreate(Suggestion(
                        child_name: _register["child_name"],
                        gender: _register["gender"],
                        age: _register["age"],
                        description: _register["description"],
                      ));
                      BlocProvider.of<SuggestionBloc>(context).add(event);
                    }
                  },
                  text: change,
                  color: Colors.teal.shade500,
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
