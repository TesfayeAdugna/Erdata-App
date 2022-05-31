import 'package:flutter/material.dart';

class BankWidgets extends StatelessWidget {
  BankWidgets({this.text_one, this.text_two, this.text_three, this.color});

  final String? text_one;
  final String? text_two;
  final String? text_three;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(30.0),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: color,
      ),
      child: Center(
          child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.account_balance),
              Text(
                // "Abissinia Bank",
                text_one!,
                style: TextStyle(fontSize: 24, color: Colors.white),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 50,
              ),
              Icon(Icons.account_circle),
              Text(
                // "10003455643544",
                text_two!,
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 50,
              ),
              Icon(Icons.place),
              Text(
                // "Wello sefer branch",
                text_three!,
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ],
      )),
    );
  }
}
