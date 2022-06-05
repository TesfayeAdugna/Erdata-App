import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:erdata/custom_widget/drawers.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar({Key? key, required this.title, required this.appBar})
      : super(key: key);

  final String title;

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(255, 104, 104, 104),
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
          ),
          Row(
              ),
          IconButton(
            alignment: Alignment.center,
            iconSize: 50.0,
            padding: EdgeInsets.all(10.0),
            icon: ClipRRect(
              child: Image.asset("assets/profile.png"),
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
