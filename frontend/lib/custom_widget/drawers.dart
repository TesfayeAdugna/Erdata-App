import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerExtends extends StatelessWidget {
  const DrawerExtends({this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    // const color = Colors.black;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/logo3.jpg",
                        width: 200,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          ListTile(
            iconColor: Colors.blue,
            selectedColor: Color.fromARGB(255, 75, 4, 167),
            leading: Icon(Icons.home_filled),
            title: Text("HOME"),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            iconColor: Colors.blue,
            selectedColor: Color.fromARGB(255, 75, 4, 167),
            leading: Icon(Icons.money),
            title: Text("DONATE"),
            onTap: () {
              context.go('/donate');
            },
          ),
          ListTile(
            iconColor: Colors.blue,
            selectedColor: Color.fromARGB(255, 28, 26, 31),
            leading: Icon(Icons.people),
            title: Text("ABOUT"),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            iconColor: Colors.blue,
            selectedColor: Color.fromARGB(255, 75, 4, 167),
            leading: Icon(Icons.checklist),
            title: Text("CHILDREN LIST"),
            onTap: () {
              context.go('/children_list');
            },
          ),
          ListTile(
            iconColor: Colors.blue,
            selectedColor: Color.fromARGB(255, 75, 4, 167),
            leading: Icon(Icons.help),
            title: Text("SUGGEST"),
            onTap: () {
              context.go('/child_suggestion');
            },
          ),
          ListTile(
            iconColor: Colors.blue,
            selectedColor: Color.fromARGB(255, 75, 4, 167),
            leading: Icon(Icons.login),
            title: Text("LOG IN"),
            onTap: () {
              context.go('/login.dart');
            },
          ),
        ],
      ),
    );
  }
}
