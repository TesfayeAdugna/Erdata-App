import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';


class ChildSuggestion extends StatelessWidget {
  const ChildSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> gender = [
      'Female',
      'Male'
    ];
   

    final formKey = GlobalKey<FormState>();
    final firstnameController = TextEditingController();
    final lastnameController = TextEditingController();

    final initiativeController = TextEditingController();
    final imageController = TextEditingController();
    final birthdateController = TextEditingController();
    final kebeleController = TextEditingController();
    final woredaController = TextEditingController();
    final storyController = TextEditingController();
    return SafeArea(
      child: LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
              appBar: HeaderBar(
                title: "SUGGEST ONE",
                appBar: AppBar(),
              ),
              body: Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 10, top: 20, bottom: 50),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      SizedBox(height: 40),
    
                      TextFormField(
                          controller: firstnameController,
                          decoration: InputDecoration(
                              hintText: "Child Firstname",
                              border: UnderlineInputBorder()),
                          validator: (String? firstname) {
                            if (firstname == null || firstname.isEmpty) {
                              return "FirstName should not be empty";
                            }
                          }),
                          SizedBox(height: 20),
                          TextFormField(
                          controller: lastnameController,
                          decoration: InputDecoration(
                              hintText: "Child Lastname",
                              border: UnderlineInputBorder()),
                          validator: (String? lastname) {
                            if (lastname == null || lastname.isEmpty) {
                              return "Lastname should not be empty";
                            }
                          }),
                      SizedBox(height: 20),
                      TextFormField(
                          controller: birthdateController,
                          decoration: InputDecoration(
                              hintText: "Date of birth(DD/MM/YY)",
                              border: UnderlineInputBorder()),
                          validator: (String? username) {
                            if (username == null || username.isEmpty) {
                              return "Birthdate should not be empty";
                            }
                          }),
                      SizedBox(height: 20),
    
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
                     
                      SizedBox(height: 20),
    
                      TextFormField(
                          controller: kebeleController,
                          decoration: InputDecoration(
                              hintText: "Address(kebele)",
                              border: UnderlineInputBorder()),
                          validator: (String? kebele) {
                            if (kebele == null || kebele.isEmpty) {
                              return "Address(kebele) field mustnot be empty";
                            }
                          }),
                      SizedBox(height: 20),
                      TextFormField(
                          controller: woredaController,
                          decoration: InputDecoration(
                              hintText: "Address(woreda)",
                              border: UnderlineInputBorder()),
                          validator: (String? woreda) {
                            if (woreda == null || woreda.isEmpty) {
                              return "Address(kebele) field mustnot be empty";
                            }
                          }),
                      SizedBox(height: 40),
                      TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: storyController,
                          decoration: InputDecoration(
                              hintText: "Child Short Story",
                              border: UnderlineInputBorder()),
                          validator: (String? description) {
                            if (description == null || description.isEmpty) {
                              return "Short Story should not be empty";
                            }
                          }),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //     keyboardType: TextInputType.multiline,
                      //     maxLines: null,
                      //     controller: initiativeController,
                      //     decoration: InputDecoration(
                      //         hintText: "Your initiative to suggest",
                      //         border: OutlineInputBorder()),
                      //     validator: (String? username) {
                      //       if (username == null || username.isEmpty) {
                      //         return "Initiative should not be empty";
                      //       }
                      //     }),
    
                      
                      SizedBox(height: 20),
                      TextFormField(
                          controller: imageController,
                          decoration: InputDecoration(
                              hintText: "Upload Image",
                              border: UnderlineInputBorder()),
                          validator: (String? username) {
                            if (username == null || username.isEmpty) {
                              return "Image should not be empty";
                            }
                          }),
    
                      SizedBox(height: 20),
                      
    
    
                      ElevatedButton(
                        onPressed: () {
                          final formValid = formKey.currentState!.validate();
                          if (!formValid) return;
                        },
                        child: Text("Save"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              drawer: const DrawerExtends(
                color: Colors.black,
               ),
            )
            ),
      ),
    );
  }
}
