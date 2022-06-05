import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:sec_2/erdata/blocs/blocs.dart';

import '../models/suggestion.dart';

class ChildrenUpdation extends StatelessWidget {
  ChildrenUpdation({Key? key, required this.suggestedid}) : super(key: key);
  final int suggestedid;
  final formKey = GlobalKey<FormState>();
  final childnameController = TextEditingController();
  final dateController = TextEditingController();
  final imageController = TextEditingController();
  final birthdateController = TextEditingController();
  final ageController = TextEditingController();
  final storyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> gender = ['Female', 'Male'];

    return SafeArea(
      child: LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
              appBar: HeaderBar(
                title: "SUGGEST ONE",
                appBar: AppBar(),
              ),
              body: BlocBuilder<SuggestionBloc, SuggestionState>(
                builder: (context, SuggestionState state) {
                  if (state is SuggestionOperationSuccess) {
                    final suggested = state.suggestions.toList();

                    final suggestedChild = suggested
                        .where((suggestion) => suggestion.id == suggestedid)
                        .first;
                    childnameController.text = suggestedChild.child_name;
                    birthdateController.text =
                        suggestedChild.regesterd_date.toString();
                    storyController.text = suggestedChild.description;
                    ageController.text = suggestedChild.age.toString();

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 10, top: 20, bottom: 50),
                      child: Form(
                        key: formKey,
                        child: ListView(
                          children: [
                            const SizedBox(height: 40),

                            TextFormField(
                                controller: childnameController,
                                decoration: InputDecoration(
                                    hintText: "Child Name",
                                    border: UnderlineInputBorder()),
                                validator: (String? firstname) {
                                  if (firstname == null || firstname.isEmpty) {
                                    return "Childname should not be empty";
                                  }
                                }),
                            const SizedBox(height: 20),

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
                                  "",
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
                                controller: ageController,
                                decoration: InputDecoration(
                                    hintText: "Age",
                                    border: UnderlineInputBorder()),
                                validator: (String? kebele) {
                                  if (kebele == null || kebele.isEmpty) {
                                    return "Field mustnot be empty";
                                  }
                                }),
                            SizedBox(height: 20),
                            TextFormField(
                                controller: dateController,
                                decoration: InputDecoration(
                                    hintText: "Date",
                                    border: UnderlineInputBorder()),
                                validator: (String? woreda) {
                                  if (woreda == null || woreda.isEmpty) {
                                    return "Date field mustnot be empty";
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
                                  if (description == null ||
                                      description.isEmpty) {
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
                                final formValid =
                                    formKey.currentState!.validate();
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
                    );
                  }
                  return Text("Couldnot Find Child");
                },
              ),
              drawer: const DrawerExtends(
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
