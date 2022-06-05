import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:erdata/admin/bloc/admin.dart';
import '../../custom_widget/header.dart';

import '../../custom_widget/drawers.dart';

class UsersList extends StatelessWidget {
  UsersList({Key? key}) : super(key: key);
  PageController pageController = PageController(viewportFraction: 0.90);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
              appBar: HeaderBar(
                title: "USERS LIST",
                appBar: AppBar(),
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
                      child: Text("Couldn't fetch users"),
                    );
                  }
                  if (state is UserListLoadSucccess) {
                    final user = state.users;
                    return ListView.builder(
                        itemCount: user.length,
                        itemBuilder: (_, int index) {
                          return ListTile(
                            leading:
                                Image(image: AssetImage("assets/logo3.jpg")),
                            title: Text(user.elementAt(index).username),
                            subtitle: Column(
                              children: [
                                Text(
                                    "Username: ${user.elementAt(index).username} "),
                                Text("Email: ${user.elementAt(index).email}"),
                              ],
                            ),
                          );
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
