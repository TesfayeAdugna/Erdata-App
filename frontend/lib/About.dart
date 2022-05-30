import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: AboutPage(),
    ));

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 59, 37, 37),
          title: Text('ERDATA'),
          actions: [
            IconButton(
              alignment: Alignment.center,
              iconSize: 518.0,
              padding: EdgeInsets.all(5.0),
              icon: Image.asset("assets/logo2.jpg"),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10.0),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all()),
                child:  Text(
                  "We are a non-governmental, non-profit organization founded on the ideals of humanism, freedom, equality and solidarity"
                ),  
              ),
          ]
          ),
        ),

    ),
    );
  }
}
