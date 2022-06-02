import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:sec_2/admin/bloc/admin_bloc.dart';
import 'package:sec_2/admin/bloc/admin_state.dart';

import '../../../custom_widget/drawers.dart';

class UsersList extends StatelessWidget {
  UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
              appBar: AppBar(
                title: Text(""),
                toolbarHeight: 80,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          child: ElevatedButton(
                            child: Text("Register Child"),
                            onPressed: () {
                              context.go('/child_registration');
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Card(
                          child: ElevatedButton(
                            child: Text("Add User"),
                            onPressed: () {
                              context.go('/user_registration');
                            },
                          ),
                        ),
                      ]),
                ),
              ),
              drawer: const DrawerExtends(
                color: Colors.black,
              ),
              body: BlocConsumer<AdminBloc, AdminState>(
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
                          return GestureDetector(onTap: () {}, child: ListTile());
                        });
                  }
                  return Text("Not handled State");
                },
              ),
             
            )),
      ),
    );
  }
}
