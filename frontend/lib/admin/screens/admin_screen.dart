import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:sec_2/admin/bloc/admin_bloc.dart';
import 'package:sec_2/admin/bloc/admin_state.dart';

import '../../../custom_widget/drawers.dart';
import '../../custom_widget/header.dart';

class UsersList extends StatelessWidget {
  UsersList({Key? key}) : super(key: key);

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
                      // 2
                      Container(
                        width: 200,
                        height: 50,
                        child: Card(
                          child: ElevatedButton(
                            child: Text("See suggestions"),
                            onPressed: () {
                              context.go('/suggested');
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
                              context.go('/userlist');
                            },
                          ),
                        ),
                      ),

                      // fetching from backend starts here.
                      BlocConsumer<AdminBloc, AdminState>(
                        listener: (_, AdminState state) {},
                        builder: (_, AdminState state) {
                          if (state is UserListLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is UserListLoadFailure) {
                            return Center(
                              child: Text("Couldnot fetch children list"),
                            );
                          }
                          if (state is UserListLoadSucccess) {
                            final user = state.users;
                            return ListView.builder(
                                itemCount: user.length,
                                itemBuilder: (_, int index) {
                                  return GestureDetector(
                                      onTap: () {}, child: ListTile());
                                });
                          }
                          return Text("Not handled State");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
