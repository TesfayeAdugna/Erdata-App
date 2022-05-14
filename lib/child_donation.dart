import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'children.dart';

class  Child_Donation extends StatefulWidget {
  
  const Child_Donation({ Key? key }) : super(key: key);

  @override
  State<Child_Donation> createState() => _Child_DonationState();
}

class _Child_DonationState extends State<Child_Donation> {
  PageController pageController = PageController(viewportFraction: 0.90);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donation"),
        centerTitle: true
      ),
      drawer: Drawer(),
      body: Center(
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index){
              
              return Container(
                width: double.maxFinite,
                height: 600,
                  child: GestureDetector(
                    onTap: (){},
                    child: _children_info(index),
                  ),
                
              );
            },
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_rounded),
            label: 'Donate',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings_suggest_rounded),
            label: 'Suggest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_rounded),
            label: 'Donate',
          )
        ]
      ),
    );
  }

  Widget _children_info(int index){
    // final List prefixes = ["Name: ", "Age: ", "Educatiool"]
    final Children child = children[index];
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
            "Name: ${child.name}" , 
            
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
