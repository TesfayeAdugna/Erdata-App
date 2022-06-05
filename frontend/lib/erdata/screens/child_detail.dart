import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erdata/erdata/blocs/blocs.dart';
import '../../custom_widget/custom_widgets.dart';

import '../models/children_model.dart';

class Child_Detail extends StatelessWidget {
  const Child_Detail({Key? key, required this.childid}) : super(key: key);
  final int childid;
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
            body: BlocBuilder<ChildrenBloc, ChildrenState>(
              builder: (_, ChildrenState state) {
                if (state is ChildrenOperationSuccess) {
                  final child = state.childrens.toList();
                  
                  final childsingle = child.where((children) => children.id == childid).first;
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
                                image: AssetImage("assets/profile_image1.jpg"),
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
                                      "Name: ${childsingle.first_name}" +
                                          " " +
                                          "${childsingle.last_name}",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 78, 73, 73),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Age: ${childsingle.age.toString()}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Gender ${childsingle.gender}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Description: ${childsingle.description}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Region: ${childsingle.region}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Woreda: ${childsingle.woreda}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Kebele: ${childsingle.kebele}",
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
                  },
                  child: Icon(Icons.edit)),
            )
            )
            );
  }
}
