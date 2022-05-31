import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../custom_widget/drawers.dart';
// import 'image_provider.dart';

class ChildSuggestion extends StatelessWidget {
  const ChildSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'None',
      'Kindergarten ',
      'Elementary',
      'HighSchool',
    ];
    final List<String> status = [
      'Not Available',
      'One or both is Available ',
      'Other Guardians Available',
    ];

    final formKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final initiativeController = TextEditingController();
    final imageController = TextEditingController();
    final ageController = TextEditingController();
    final educationController = TextEditingController();
    final parentController = TextEditingController();
    final storyController = TextEditingController();
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
            appBar: AppBar(
              title: Text("Suggest One"),
              centerTitle: true,
              flexibleSpace: IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.arrow_back_sharp),
                onPressed: () {},
              ),
            ),
            drawer: const DrawerExtends(
              color: Colors.black,
            ),
            body: Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 10, top: 20, bottom: 50),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Image.asset("assets/logo2.jpg"),
                      ),
                    ),
                    SizedBox(height: 40),

                    TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            hintText: "Child FullName",
                            border: UnderlineInputBorder()),
                        validator: (String? username) {
                          if (username == null || username.isEmpty) {
                            return "FirstName should not be empty";
                          }
                        }),

                    SizedBox(height: 20),
                    TextFormField(
                        controller: ageController,
                        decoration: InputDecoration(
                            hintText: "Child Age",
                            border: UnderlineInputBorder()),
                        validator: (String? username) {
                          if (username == null || username.isEmpty) {
                            return "Age should not be empty";
                          }
                        }),
                    SizedBox(height: 20),

                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField2(
                        hint: Text(
                          'Education Level ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
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
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField2(
                        hint: Text(
                          'Parents \' Status',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: status
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
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

                    SizedBox(height: 20),
                    TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: storyController,
                        decoration: InputDecoration(
                            hintText: "Child Short Story",
                            border: OutlineInputBorder()),
                        validator: (String? username) {
                          if (username == null || username.isEmpty) {
                            return "Short Story should not be empty";
                          }
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: initiativeController,
                        decoration: InputDecoration(
                            hintText: "Your initiative to suggest",
                            border: OutlineInputBorder()),
                        validator: (String? username) {
                          if (username == null || username.isEmpty) {
                            return "Initiative should not be empty";
                          }
                        }),

                    //   <ImageInputAdapter>(
                    //   previewImageBuilder: (_, ImageInputAdapter image) =>
                    //     image.widgetize(),
                    //   buttonBuilder: (_, int count) =>
                    //     Container(
                    //       child: Text(
                    //         count == null || count < 1 ? "Upload Image" : "Upload More"
                    //       )
                    //     )
                    //   initializeFileAsImage: (File file) =>
                    //     ImageInputAdapter(file: file),
                    //   initialValue: existingPhotoUrl == null ? null : (List<ImageInputImageAdapter>()..add(ImageInputImageAdapter(url: existingPhotoUrl))),
                    //   // Even if `shouldAllowMultiple` is true, images will always be a `List` of the declared type (i.e. `ImageInputAdater`).
                    //   onSaved: (images) _images = images,
                    // ),
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
          )),
    );
  }
}
