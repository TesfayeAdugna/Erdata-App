import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:erdata/erdata/blocs/blocs.dart';
import 'package:erdata/erdata/models/model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../custom_widget/RoundButton.dart';
import '../../custom_widget/constant.dart';
import '../../custom_widget/drawers.dart';
import '../../custom_widget/header.dart';
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


















// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:sec_2/custom_widget/custom_widgets.dart';


// class ChildSuggestion extends StatelessWidget {
//   const ChildSuggestion({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> gender = [
//       'Female',
//       'Male'
//     ];
   

//     final formKey = GlobalKey<FormState>();
//     final childnameController = TextEditingController();

//     final birthdateController = TextEditingController();
//     final usernameController = TextEditingController();
   
//     final storyController = TextEditingController();
//     return SafeArea(
//       child: LayoutBuilder(
//         builder: ((context, constraints) => Scaffold(
//               appBar: HeaderBar(
//                 title: "SUGGEST ONE",
//                 appBar: AppBar(),
//               ),
//               body: Padding(
//                 padding:
//                     const EdgeInsets.only(left: 40, right: 10, top: 20, bottom: 50),
//                 child: Form(
//                   key: formKey,
//                   child: ListView(
//                     children: [
//                       const SizedBox(height: 40),
    
//                       TextFormField(
//                           controller: childnameController,
//                           decoration: InputDecoration(
//                               hintText: "Child Name",
//                               border: UnderlineInputBorder()),
//                           validator: (String? firstname) {
//                             if (firstname == null || firstname.isEmpty) {
//                               return "Childname should not be empty";
//                             }
//                           }),
//                           const SizedBox(height: 20),
                          
//                       SizedBox(height: 20),
//                       TextFormField(
//                           controller: birthdateController,
//                           decoration: InputDecoration(
//                               hintText: "Date of birth(DD/MM/YY)",
//                               border: UnderlineInputBorder()),
//                           validator: (String? username) {
//                             if (username == null || username.isEmpty) {
//                               return "Birthdate should not be empty";
//                             }
//                           }),
//                       SizedBox(height: 20),
    
//                       DropdownButtonHideUnderline(
//                         child: DropdownButtonFormField2(
//                           hint: Text(
//                             'Gender',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Theme.of(context).hintColor,
//                             ),
//                           ),
//                           items: gender
//                               .map((gender) => DropdownMenuItem<String>(
//                                     value: gender,
//                                     child: Text(
//                                       gender,
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ))
//                               .toList(),
//                           onChanged: (value) {},
//                           buttonHeight: 40,
//                           buttonWidth: 140,
//                           itemHeight: 40,
//                         ),
//                       ),
                     
//                       SizedBox(height: 20),
    
//                       TextFormField(
//                           controller: usernameController,
//                           decoration: InputDecoration(
//                               hintText: "Your username",
//                               border: UnderlineInputBorder()),
//                           validator: (String? kebele) {
//                             if (kebele == null || kebele.isEmpty) {
//                               return "Field mustnot be empty";
//                             }
//                           }),
                      
//                       SizedBox(height: 40),
//                       TextFormField(
//                           keyboardType: TextInputType.multiline,
//                           maxLines: null,
//                           controller: storyController,
//                           decoration: InputDecoration(
//                               hintText: "Child Short Story",
//                               border: UnderlineInputBorder()),
//                           validator: (String? description) {
//                             if (description == null || description.isEmpty) {
//                               return "Short Story should not be empty";
//                             }
//                           }),
//                       // SizedBox(height: 20),
//                       // TextFormField(
//                       //     keyboardType: TextInputType.multiline,
//                       //     maxLines: null,
//                       //     controller: initiativeController,
//                       //     decoration: InputDecoration(
//                       //         hintText: "Your initiative to suggest",
//                       //         border: OutlineInputBorder()),
//                       //     validator: (String? username) {
//                       //       if (username == null || username.isEmpty) {
//                       //         return "Initiative should not be empty";
//                       //       }
//                       //     }),
    
                      
    
//                       SizedBox(height: 20),
                      
    
    
//                       ElevatedButton(
//                         onPressed: () {
//                           final formValid = formKey.currentState!.validate();
//                           if (!formValid) return;
//                         },
//                         child: Text("Save"),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.brown,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               drawer: const DrawerExtends(
//                 color: Colors.black,
//                ),
//             )
//             ),
//       ),
//     );
//   }
// }
