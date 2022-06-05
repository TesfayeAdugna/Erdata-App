import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:erdata/admin/bloc/admin_bloc.dart';
import 'package:erdata/admin/bloc/admin_state.dart';

import '../../../custom_widget/drawers.dart';
import '../../custom_widget/header.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
              appBar: HeaderBar(
                title: "Dashboard",
                appBar: AppBar(),
              ),
              drawer: const DrawerExtends(
                color: Colors.black,
              ),
              body: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      // The three buttons on Dashboard page.
                      // 1
                      Container(
                        width: 200,
                        height: 50,
                        child: Card(
                          child: ElevatedButton(
                            child: Text("Register Child"),
                            onPressed: () {
                              context.go('/child_registration');
                            },
                          ),
                        ),
                      ),
                     
                      Container(
                        width: 200,
                        height: 50,
                        child: Card(
                          child: ElevatedButton(
                            child: const Text("See suggestions"),
                            onPressed: () {
                              context.go('/suggested_list');
                            },
                          ),
                        ),
                      ),
                      // 3
                      Container(
                        width: 200,
                        height: 50,
                        child: Card(
                          child: ElevatedButton(
                            child: Text("See User List"),
                            onPressed: () {
                              
                              context.go('/user_list');
                            },
                          ),
                        ),
                      ),

                      // fetching from backend starts here.
                      // BlocConsumer<AdminBloc, AdminState>(
                      //   listener: (_, AdminState state) {},
                      //   builder: (_, AdminState state) {
                      //     if (state is UserListLoading) {
                      //       return Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }
                      //     if (state is UserListLoadFailure) {
                      //       return Center(
                      //         child: Text("Couldnot fetch children list"),
                      //       );
                      //     }
                      //     if (state is UserListLoadSucccess) {
                      //       final user = state.users;
                      //       return ListView.builder(
                      //           itemCount: user.length,
                      //           itemBuilder: (_, int index) {
                      //             return GestureDetector(
                      //                 onTap: () {}, child: ListTile());
                      //           });
                      //     }
                      //     return Text("Not handled State");
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
