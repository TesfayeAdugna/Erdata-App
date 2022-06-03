import 'package:flutter/material.dart';

import '../../custom_widget/drawers.dart';
import '../../custom_widget/header.dart';

class UserList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HeaderBar(
                  title: "Users",
                  appBar: AppBar(),
                ),
                drawer: const DrawerExtends(
                  color: Colors.black,
                ),
        body: ListView(
          children:[
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(20),
              child: Table(
                border: TableBorder.all(),
                children: <TableRow>[
                  // the first row, header row.
                  TableRow(
                    children: <Widget>[
                      Container(
                        height: 40,
                        child: Text("Username"),
                      ),
                      Container(
                        height: 40,
                        child: Text("Full Name"),
                      ),
                      Container(
                        height: 40,
                        child: Text("Email"),
                      ),
                    ],
                  ),
                  // the many rows, this will be iterative and will be many.
                  TableRow(
                    children: <Widget>[
                      Container(
                        height: 30,
                      ),
                      Container(
                        height: 30,
                      ),
                      Container(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
