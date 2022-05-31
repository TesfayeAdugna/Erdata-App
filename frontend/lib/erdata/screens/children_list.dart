import 'package:erdata_app1/Children/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'children.dart';
import 'package:go_router/go_router.dart';
import '../bloc/index.dart';
class ChildrenList extends StatelessWidget {
  ChildrenList({Key? key}) : super(key: key);
  PageController pageController = PageController(viewportFraction: 0.90);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) => Scaffold(
      appBar: AppBar(
        title: Text("CHILDREN LIST"),
        centerTitle: true,
        
      ),
      drawer: Drawer(),
      body: BlocConsumer<ChildrenBloc, Children_State>(
        listener: (_, Children_State state){},
        builder: (_, Children_State state){
          return PageView.builder(
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index){
              
              return Container(
                width: double.maxFinite,
                height: 600,
                  child: GestureDetector(
                    onTap:(){
                      return context.goNamed("detail");
                    },
                    child: _children_info(index)
                  ),
                
              );
            },
          );
        },
         
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return context.goNamed("suggest");
        },
        child: Icon(Icons.add)
      ),
    )
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