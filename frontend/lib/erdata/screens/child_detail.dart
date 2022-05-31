import 'package:flutter/material.dart';
import 'children.dart';
class Child_Detail extends StatelessWidget {
  const Child_Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) => Scaffold(
      appBar: AppBar(
        title: Text("children detail"),
      ),

      body: Center(
        child: _children_detail(),
      ),
    )
    ),
    );

  }
   Widget _children_detail(){
    // final List prefixes = ["Name: ", "Age: ", "Educatiool"]
    final Children child = children[0];
    return Stack(
      alignment: Alignment(1.0, 1.0),
    children:[
      Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
      margin: EdgeInsets.all(10),
      height: 250,
      width: double.maxFinite,
      
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(child.Image),
          fit:BoxFit.cover,     
          ),
      ),
      // child: CircleAvatar(
      //   backgroundImage: AssetImage("assets/child_1.jpg"),
      //   radius: 50,
      // ),
    ),
      ),
    Positioned(
      top: 220,
      right: 10,
      left: 10,
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        width: 300,
        height: 270,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
        child:Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
          children: <Widget>[
            Text(
            "Name: ${child.name}", 
            
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 20),
            Text(
            "Age: ${child.age.toString()}",
            
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 20),
            Text(
            "Education Level: ${child.Education_level}" ,
            
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 20),
            Text(
            "Parent's Status: ${child.Parent_status}" ,
            
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 20),
            Text(
            "Short Story: ${child.Short_Story}",
            
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
          ],
          ),
        ),
        ),
         ),
      ),
    
      
      
    ], 
    
    );
  }
}