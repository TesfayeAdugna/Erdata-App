import 'package:flutter/material.dart';
class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  
  
  const SmallText({ Key? key,
  required this.text,
  this.color =const Color(0xff332d2b),
  this.size: 13 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}