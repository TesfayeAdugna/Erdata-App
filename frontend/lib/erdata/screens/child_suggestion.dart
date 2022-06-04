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
                // TextFormField(
                //     validator: (value) {
                //       if (value != null && value.isEmpty) {
                //         return 'gender';
                //       }
                //       return null;
                //     },
                //     textAlign: TextAlign.center,
                //     decoration: kTextFileDecoration.copyWith(
                //       hintText: 'gender',
                //     ),
                //     onSaved: (value) {
                //       setState(() {
                //         _register["gender"] = value;
                //       });
                //     }),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2(
                    hint: Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: gender
                        .map((gender) => DropdownMenuItem<String>(
                              value: gender,
                              child: Text(
                                gender,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {},
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'age';
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
                      return null;
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
                imageUpload(),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      scaffoldState.currentState!
                          .showBottomSheet((context) => selectionbar());

                      // showBottomSheet(
                      //     context: context,
                      //     builder: (builder) => selectionbar());
                    },
                    child: Text("Upload Image")),
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
                      BlocProvider.of<SuggestionBloc>(context)
                          .add(SuggestionLoad());
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     CoursesList.routeName, (route) => false);
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

  Widget imageUpload() {
    return Container(
      height: 100,
      width: 100,
      child: Image(
          image: _image == (null)
              ? AssetImage("assets/logo3.jpg")
              : AssetImage(_image.path)),
    );
  }

  Widget selectionbar() {
    return Container(
      color: Colors.grey[100],
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Choose Photo from"),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _picker.pickImage(source: ImageSource.camera);
                        });
                      },
                      icon: Icon(Icons.camera),
                    ),
                    Text("Camera")
                  ]),
              SizedBox(width: 10),
              Row(children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _picker.pickImage(source: ImageSource.gallery);
                    });
                  },
                  icon: Icon(Icons.image),
                ),
                Text("Gallery")
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
