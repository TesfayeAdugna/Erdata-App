import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/erdata/blocs/blocs.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';

import '../blocs/blocs.dart';

class ChildrenList extends StatelessWidget {
  ChildrenList({Key? key, children}) : super(key: key);
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
              appBar: HeaderBar(
                title: "CHILDREN LIST",
                appBar: AppBar(),
              ),
              drawer: const DrawerExtends(
                color: Colors.black,
              ),
              body: BlocConsumer<ChildrenBloc, ChildrenState>(
                listener: (_, ChildrenState state) {},
                builder: (_, ChildrenState state) {
                  if (state is ChildrenLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ChildrenOperationFailure) {
                    return const Center(
                      child: Text("Couldnot fetch children list"),
                    );
                  }
                  if (state is ChildrenOperationSuccess) {
                    final children = state.childrens;
                    return 
                     PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.vertical,
                        itemCount: children.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () {
                              context.go(
                                  "/children_list/${children.elementAt(index).id}");
                            },
                            child: Stack(
                              alignment: Alignment(1.0, 1.0),
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 250,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                      image: const DecorationImage(
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
                                        const EdgeInsets.only(left: 30, right: 30),
                                    width: 300,
                                    height: 270,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Center(
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Name: ${children.elementAt(index).first_name + " " + children.elementAt(index).last_name}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Age: ${children.elementAt(index).age.toString()}",
                                              style: const TextStyle(
                                                color: Color.fromRGBO(0, 0, 0, 1),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Gender: ${children.elementAt(index).gender}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Region: ${children.elementAt(index).region}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Kebele: ${children.elementAt(index).kebele}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Woreda: ${children.elementAt(index).woreda}",
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
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    return context.goNamed("child_suggestion");
                  },
                  child: const Icon(Icons.add)),
            )),
      ),
    );
  }
}
