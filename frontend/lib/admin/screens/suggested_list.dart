import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../custom_widget/header.dart';
import '../../erdata/blocs/blocs.dart';
import '../../custom_widget/drawers.dart';

class SuggestedList extends StatelessWidget {
  SuggestedList({Key? key}) : super(key: key);
  PageController pageController = PageController(viewportFraction: 0.90);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
              appBar: HeaderBar(
                title: "SUGGESTED CHILDREN LIST",
                appBar: AppBar(),
              ),
              drawer: const DrawerExtends(
                color: Colors.black,
              ),
              body: BlocConsumer<SuggestionBloc, SuggestionState>(
                listener: (_, SuggestionState state) {},
                builder: (_, SuggestionState state) {
                  if (state is SuggestionLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SuggestionOperationFailure) {
                    return const Center(
                      child: Text("Couldnot fetch children list"),
                    );
                  }
                  if (state is SuggestionOperationSuccess) {
                    final suggested = state.suggestions;
                    return PageView.builder(
                        itemCount: suggested.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () {},
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
                                        image: AssetImage(
                                            "assets/profile_image1.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 220,
                                  right: 10,
                                  left: 10,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 30, right: 30),
                                    width: 300,
                                    height: 270,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 50),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Name: ${suggested.elementAt(index).child_name }",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "BirthDate: ${suggested.elementAt(index).brith_date}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Gender: ${suggested.elementAt(index).gender}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Date : ${suggested.elementAt(index).date}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Short Story: ${suggested.elementAt(index).description}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Suggested by: ${suggested.elementAt(index).suggested_by}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                  return const Text("Not handled State");
                },
              ),
              
            )),
      
    );
  }
}
