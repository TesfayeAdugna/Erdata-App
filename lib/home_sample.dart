import 'smallText.dart';
import 'package:flutter/material.dart';
import 'children.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final describe =  "Let us all stand together and lift our children from where they are. Let us give them hope because they are our future tomorrow. Let us give them strength for they will be our strength when we need it. Let us give them the love and care they deserve for they are our children.";
  final whiteColor = Colors.white;
  final bool hidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             IconButton(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5.0),
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            Row(
              children: [
            IconButton(
              alignment: Alignment.center,
              iconSize: 50.0,
              padding: EdgeInsets.all(5.0),
              icon: ClipRRect(
                child: Image.asset("assets/logo2.jpg"),
                borderRadius: BorderRadius.circular(50),),
                
              onPressed: () {},
            ),
            Text("ERDATA"),
              ],
            ),
            IconButton(
              alignment: Alignment.center,
              iconSize: 50.0,
              padding: EdgeInsets.all(5.0),
              icon: ClipRRect(
                child: Image.asset("assets/profile_image2.jpg"),
                borderRadius: BorderRadius.circular(50),),
                
              onPressed: () {},
            ),
          ],
        ),
      ),
        
      body: Center(
        child: Column(  
        children: [
          Container(
          height: 200, 
          width: double.maxFinite,
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10 ),      
          decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                // borderRadius: BorderRadius.circular(25.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " WELCOME TO ERDATA ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SmallText(text: describe,
                    color: Colors.white,)
                  ],
                ),
        ),
          Row(
          children : 
          [
          Expanded(
          child: Container(
          width: double.maxFinite,
          height: 250,
        child:ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: (children.length) - 3,
          separatorBuilder: (BuildContext context, int index){
            return SizedBox(width: 20);
          },
          itemBuilder: (BuildContext context, int index){
            final child = children[index];
            return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
               width: 200, 
              height: 100,
              child: Column(
              children: [
              CircleAvatar(
              backgroundImage: AssetImage("assets/child_1.jpg"),
              radius: 50,
            ),
            SizedBox(height: 20),
             Text(
            "Name: ${child.name}" , 
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 10),
            Text(
            "Age ${child.age.toString()}" , 
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),

              ],
             
              
            )
            );
          }),
          ),

            ),
            
        
          
              
          IconButton(
            icon:Icon(Icons.arrow_circle_right),
            onPressed: (){},
          ),
          ],
          ),
            ],
        
        
        
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
  // Widget _sample(int index){
  //   return  Column(
  //       children: [
          
         
          
  //     ),
          
  //       ],
      
  //   );
  // }
}