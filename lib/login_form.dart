import 'package:flutter/material.dart';
import 'home_sample.dart';
class Login_Form extends StatefulWidget {
  const Login_Form({ Key? key }) : super(key: key);

  @override
  State<Login_Form> createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void dispose() {
    _nameController.dispose();
    super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ERDATA", 
        style:TextStyle(
          color: Colors.white,
        ) ,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign up to erdata app and help the children",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
              height: 25,
            ),

              TextFormField(
            
            keyboardType: TextInputType.name,
            decoration: InputDecoration(  
            border: OutlineInputBorder(),  
            labelText: 'Email',  
            hintText: 'Enter your email',
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
            SizedBox(
              height: 25,
            ),
            TextFormField(
            
            keyboardType: TextInputType.name,
            decoration: InputDecoration(  
            border: OutlineInputBorder(),  
            labelText: 'Phone Number',  
            hintText: 'Enter your phone',
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
            SizedBox(
              height: 25,
            ),
            TextFormField(
            
            keyboardType: TextInputType.name,
            decoration: InputDecoration(  
            border: OutlineInputBorder(),  
            labelText: 'Username',  
            hintText: 'Create Username',
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
            SizedBox(
              height: 25,
            ),
            TextFormField(
            obscureText: true,
            
            decoration: InputDecoration(  
            border: OutlineInputBorder(),  
            labelText: 'Password',  
            hintText: 'Create Password',
            ),
            controller: _passwordController,
            autocorrect: false,  
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Username Required';
                }
                return null;
                 },   
            ),
             SizedBox(
              height: 25,
            ),
            
          
          Row(
            children: [
              Checkbox(value: true, onChanged: (value){
                return null;
              }),
              SizedBox(width: 15),
              Expanded(
              child: Text("By signig up tp erdara app I agree to become active member helping street kids."),
              ),
            ],
          ),
          SizedBox(
              height: 25,
            ),
            Row(
            children:[
              
            Expanded(
            child: ElevatedButton(
            
            onPressed: (){
              Navigator.push(context, 
                MaterialPageRoute(builder: (BuildContext context){
                  return Home();
                }));
            },
            child: Container(
              padding: EdgeInsets.all(8),
            child:Text(
              "Sign Up",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
            
          ),
            ),
            ],
            ),
            ],
            ),
        ),
      ),
    );
  }
}