import 'package:flutter/material.dart';

TextStyle kTxtKeyStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.deepPurple,
);

TextStyle kTxtValueStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.normal,
  color: Color.fromARGB(255, 40, 9, 133),
);

TextStyle kTxtDescription = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: Colors.cyan,
);

TextStyle kDonate = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 35, 4, 121),
);

SizedBox kVSpace = SizedBox(
  height: 25,
);

const kTextFileDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
