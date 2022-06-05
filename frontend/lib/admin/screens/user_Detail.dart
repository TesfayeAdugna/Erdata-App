import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erdata/account/blocs/blocs.dart';
import 'package:erdata/account/models/model.dart';
import '../../custom_widget/custom_widgets.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key, required this.userid}) : super(key: key);
  final int userid;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
          appBar: AppBar(
            title: Text("USER_DETAIL"),
          ),
          drawer: const DrawerExtends(
            color: Colors.black,
          ),
          body: BlocBuilder<UserBloc, UserState>(
              builder: ((context, UserState state) {
            if (state is UserOperationSuccess) {
              final users= state.users.toList();
                  
                  final user = users.where((user) => user.id == userid).first;
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

                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.remove)),
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
                                  "Name: ${user.username}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                
                                SizedBox(height: 20),
                                Text(
                                  "Email ${user.email}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                
                                Text(
                                  "Date Joined ${user.date_joined}",
                                  style: TextStyle(
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
            }
            return const Text("User Loading Failure");
          })))),
    );
  }
}
