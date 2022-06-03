import 'package:flutter/material.dart';
import '../../custom_widget/drawers.dart';
import '../../custom_widget/header.dart';

class Suggested extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HeaderBar(
                  title: "Suggested children",
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
                columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(0.5),
                    2: FlexColumnWidth(0.75),
                    3: FlexColumnWidth(),
                    4: FlexColumnWidth(2),
                  },
                children: <TableRow>[
                  // the first row, header row.
                  TableRow(
                    children: <Widget>[
                      Container(
                        height: 40,
                        child: Text("Full Name"),
                      ),
                      Container(
                        height: 40,
                        child: Text("Age"),
                      ),
                      Container(
                        height: 40,
                        child: Text("Gender"),
                      ),
                      Container(
                        height: 40,
                        child: Text("Address"),
                      ),
                      Container(
                        height: 40,
                        child: Text("Short Story of the kid"),
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
