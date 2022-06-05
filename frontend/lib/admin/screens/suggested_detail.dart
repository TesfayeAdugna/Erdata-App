import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/erdata/blocs/blocs.dart';
import '../../custom_widget/custom_widgets.dart';

class Suggested_Detail extends StatelessWidget {
  const Suggested_Detail({Key? key, required this.suggestedid})
      : super(key: key);
  final int suggestedid;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
              appBar: HeaderBar(
                title: "ERDATA",
                appBar: AppBar(),
              ),
              drawer: const DrawerExtends(
                color: Colors.black,
              ),
              body: BlocBuilder<SuggestionBloc, SuggestionState>(
                builder: (_, SuggestionState state) {
                  if (state is SuggestionOperationSuccess) {
                    final suggested = state.suggestions.toList();

                    final suggestedChild = suggested
                        .where((suggestion) => suggestion.id == suggestedid)
                        .first;
                    // child.where((childsingle) {
                    //   return childsingle
                    // },);
                    return Center(
                      child: Stack(
                        alignment: Alignment(1.0, 1.0),
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 250,
                              width: double.maxFinite,

                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/profile_image1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // child: CircleAvatar(
                              //   backgroundImage: AssetImage("assets/child_1.jpg"),
                              //   radius: 50,
                              // ),
                            ),
                          ),
                          Positioned(
                            top: 220,
                            right: 10,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 30, right: 30),
                              width: 300,
                              height: 400,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 50),
                                  child: ListView(
                                    children: <Widget>[
                                      Text(
                                        "Name: ${suggestedChild.child_name}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 78, 73, 73),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Age: ${suggestedChild.age}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Gender: ${suggestedChild.gender}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Description: ${suggestedChild.description}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Text("Couldn't get Child");
                },
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.goNamed("/suggested_list/$suggestedid");
                  },
                  child: Icon(Icons.edit)),
            )));
  }
}
