import 'package:flutter/material.dart';
import '../../custom_widget/custom_widgets.dart';

import '../models/children_model.dart';

class Child_Detail extends StatelessWidget {
  const Child_Detail({Key? key, required this.child}) : super(key: key);
  final Children child;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
            appBar: AppBar(
              title: Text("children detail"),
            ),
            drawer: const DrawerExtends(
              color: Colors.black,
            ),
            body: Center(
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
                      margin: EdgeInsets.only(left: 30, right: 30),
                      width: 300,
                      height: 270,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Name: ${child.first_name + " " + child.last_name}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "BirthDate ${child.age}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Gender ${child.gender}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Description: ${child.description}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Region: ${child.region}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Woreda: ${child.woreda}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Kebele: ${child.kebele}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                             ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
