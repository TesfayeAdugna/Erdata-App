import 'package:flutter/material.dart';
import 'package:erdata/custom_widget/custom_widgets.dart';

import '../../custom_widget/drawers.dart';

class Donate extends StatelessWidget {
  const Donate({Key? key}) : super(key: key);
  final whiteColor = Colors.white;
  final String text = "Donate";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HeaderBar(
          title: "DONATE",
          appBar: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BankWidgets(
                      text_one: ("Commercial Bank of Ethiopia"),
                      text_two: ("10003455643544"),
                      text_three: ("Korea Hospital branch"),
                      color: Colors.purple,
                    ),
                    BankWidgets(
                      text_one: ("Oromia International Bank"),
                      text_two: ("10003455643544"),
                      text_three: ("Wello sefer branch"),
                      color: Colors.orange,
                    ),
                    BankWidgets(
                      text_one: ("Zemen Bank"),
                      text_two: ("10003455643544"),
                      text_three: ("6-Kilo branch"),
                      color: Color.fromARGB(255, 23, 226, 30),
                    ),
                    BankWidgets(
                      text_one: ("Abissinia Bank"),
                      text_two: ("10003455643544"),
                      text_three: ("Bole branch"),
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Footer(),
            ],
          ),
        ),
        drawer: const DrawerExtends(
          color: Colors.black,
        ),
      ),
    );
  }
}
