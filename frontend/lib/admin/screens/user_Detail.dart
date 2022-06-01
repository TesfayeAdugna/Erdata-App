import 'package:flutter/material.dart';
import 'package:sec_2/account/models/model.dart';
import '../../custom_widget/custom_widgets.dart';



class UserDetail extends StatelessWidget {
  const UserDetail({Key? key, required this.user}) : super(key: key);
  final Registration user;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
            appBar: AppBar(
              title: Text("user detail"),
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
        Align(
          alignment: Alignment.topRight,
          child: Icon(Icons.remove)
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
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Name: ${user.first_name + " " + user.last_name}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "BirthDate ${user.username}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Gender ${user.email}",
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
