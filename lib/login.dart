import 'home_sample.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({ Key? key }) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void dispose() {
    _nameController.dispose();
    super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donate For Children"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black12,
          ),
        // padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
              "Login if you have already signed in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
            Container(
            padding: EdgeInsets.only(left: 20, right: 20),
           
            child:TextFormField(
            
            keyboardType: TextInputType.name,
            decoration: InputDecoration(  
            border: OutlineInputBorder(),  
            labelText: 'Username',  
            hintText: 'Enter your username',
            ),
            controller: _nameController,
            autocorrect: false,  
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Username Required';
                }
                return null;
                 },   
            ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child:TextField(
            obscureText: true,  
            
            decoration: InputDecoration(  
            border: OutlineInputBorder(),  
            labelText: 'Password',  
            hintText: 'Enter Password',  
                    ),   
            ),
            ),
            
            SizedBox(
              height: 20,
            ),
            
        Container(
          child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, 
                MaterialPageRoute(builder: (BuildContext context){
                  return Home();
                }));
            },
            child: Text(
              "Login",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            
          ),
        ),
        SizedBox(
              height: 20,
            ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
            "Haven't signed in yet?" ,
            
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            ElevatedButton(
              onPressed: (){
                
              },
               child: Text(
                 "Sign Up",
                 style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              
               ),
               
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