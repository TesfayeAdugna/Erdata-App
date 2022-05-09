import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final describe =
      "Let us all stand together and lift our children from where they are. Let us give them hope because they are our future tomorrow. Let us give them strength for they will be our strength when we need it. Let us give them the love and care they deserve for they are our children.";
  final whiteColor = Colors.white;
  final seeStyle = TextStyle(
    color: Color.fromARGB(255, 7, 80, 139),
    fontSize: 18,
  );
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 71, 52, 52),
                    borderRadius: BorderRadius.circular(25.0)),
                child: Column(
                  children: [
                    Text(
                      " WELCOME TO ERDATA ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 80, 14),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      describe,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,   added later to check
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/profile_image1.jpg",
                                  width: 180,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("NAME:   firstname"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BIRTHDATE: DD/MM/YY"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("ADDRESS:   City,address"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "\n See More...",
                                textAlign: TextAlign.center,
                                style: seeStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 200,
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/profile_image1.jpg",
                                  width: 180,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("NAME:   firstname"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BIRTHDATE: DD/MM/YY"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("ADDRESS:   City,address"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "\n See More...",
                                textAlign: TextAlign.center,
                                style: seeStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 200,
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/profile_image1.jpg",
                                  width: 180,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("NAME:   firstname"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BIRTHDATE: DD/MM/YY"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("ADDRESS:   City,address"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "\n See More...",
                                textAlign: TextAlign.center,
                                style: seeStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 200,
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/profile_image1.jpg",
                                  width: 180,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("NAME:   firstname"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("BIRTHDATE: DD/MM/YY"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("ADDRESS:   City,address"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "\n See More...",
                                textAlign: TextAlign.center,
                                style: seeStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, color: whiteColor),
                            SizedBox(width: 16),
                            Text(
                              "PHONE",
                              style: TextStyle(color: whiteColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.telegram, color: whiteColor),
                            SizedBox(width: 16),
                            Text(
                              "TELEGRAM",
                              style: TextStyle(color: whiteColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook, color: whiteColor),
                            SizedBox(width: 16),
                            Text(
                              "FACEBOOK",
                              style: TextStyle(color: whiteColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera, color: whiteColor),
                            SizedBox(width: 16),
                            Text(
                              "INSTAGRAM",
                              style: TextStyle(color: whiteColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, color: whiteColor),
                            SizedBox(width: 16),
                            Text(
                              "EMAIL",
                              style: TextStyle(color: whiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/logo3.jpg",
                            width: 200,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
              ListTile(
                iconColor: Colors.blue,
                selectedColor: Color.fromARGB(255, 75, 4, 167),
                leading: Icon(Icons.home_filled),
                title: Text("HOME"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.blue,
                selectedColor: Color.fromARGB(255, 75, 4, 167),
                leading: Icon(Icons.money),
                title: Text("DONATE"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.blue,
                selectedColor: Color.fromARGB(255, 75, 4, 167),
                leading: Icon(Icons.people),
                title: Text("ABOUT"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.blue,
                selectedColor: Color.fromARGB(255, 75, 4, 167),
                leading: Icon(Icons.checklist),
                title: Text("CHILDREN LIST"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.blue,
                selectedColor: Color.fromARGB(255, 75, 4, 167),
                leading: Icon(Icons.help),
                title: Text("SUGGEST"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
