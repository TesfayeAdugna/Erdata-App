import 'package:flutter/material.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:sec_2/erdata/screens/screens.dart';
import 'package:go_router/go_router.dart';

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
        appBar: HeaderBar(
          title: "",
          appBar: AppBar(),
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
                    color: Color.fromARGB(255, 71, 52, 52).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(25.0)),
                child: Column(
                  children: [
                    Text(
                      " WELCOME TO ERDATA \n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 80, 14),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SmallText(text: describe, color: whiteColor),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        height: 350,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                (children.length) - (children.length - 4),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(width: 20);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              final child = children[index];
                              return Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  padding: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 200,
                                  height: 300,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "assets/profile_image1.jpg",
                                          width: 160,
                                          height: 120,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "NAME: ${child.name}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "AGE: ${child.age}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "EDUCATION: ${child.Education_level}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          context.go('/child_detail');
                                        },
                                        child: Text(
                                          "\n SEE MORE...",
                                          textAlign: TextAlign.center,
                                          style: seeStyle,
                                        ),
                                      ),
                                    ],
                                  ));
                            }),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_circle_right),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
        drawer: const DrawerExtends(
          color: Colors.black,
        ),
      ),
    );
  }
}
