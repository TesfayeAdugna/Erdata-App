import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'children.dart';
import 'smallText.dart';
import '../custom_widget/drawers.dart';

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
          title: Text('ERDATA'),
          backgroundColor: Color.fromARGB(255, 25, 6, 133),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Row(
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    iconSize: 200.0,
                    padding: EdgeInsets.all(5.0),
                    icon: ClipRRect(
                      child: Image.asset("assets/logo2.jpg"),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                alignment: Alignment.center,
                iconSize: 50.0,
                padding: EdgeInsets.all(10.0),
                icon: ClipRRect(
                  child: Image.asset("assets/profile_image2.jpg"),
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {},
              ),
            ],
          ),
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
                                        "DOB: ${child.dob}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "ADDRESS: ${child.address}",
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
                                          Navigator.pop(context);
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            String telephoneNum = '+251 921787397';
                            String telephoneUrl = "sms: $telephoneNum";
                            if (await canLaunchUrlString(telephoneUrl)) {
                              await launchUrlString(telephoneUrl);
                            } else {
                              throw " Error occured connecting to that cell number.";
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, color: whiteColor),
                              const SizedBox(width: 16),
                              Text(
                                "PHONE",
                                style: TextStyle(color: whiteColor),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String TelegramUrl = "https:telegram.me/Ashbel0";
                            if (await canLaunchUrlString(TelegramUrl)) {
                              await launchUrlString(TelegramUrl);
                            } else {
                              throw " Error occured connecting to the Telegram.";
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.telegram, color: whiteColor),
                              const SizedBox(width: 16),
                              Text(
                                "TELEGRAM",
                                style: TextStyle(color: whiteColor),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String FacebookUrl =
                                "https:facebook.com/people/Tesfaye-Adugna/100077814634008/";
                            if (await canLaunchUrlString(FacebookUrl)) {
                              await launchUrlString(FacebookUrl);
                            } else {
                              throw " Error occured connecting to the Facebook.";
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook, color: whiteColor),
                              const SizedBox(width: 16),
                              Text(
                                "FACEBOOK",
                                style: TextStyle(color: whiteColor),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String InstagramUrl =
                                "https:instagram.com/tesfishadugna/";
                            if (await canLaunchUrlString(InstagramUrl)) {
                              await launchUrlString(InstagramUrl);
                            } else {
                              throw " Error occured connecting to the Instagram.";
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera, color: whiteColor),
                              const SizedBox(width: 16),
                              Text(
                                "INSTAGRAM",
                                style: TextStyle(color: whiteColor),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String EmailAddress = 'arunokijonathan@gmail.com';
                            String EmailSubject =
                                " Erdata app, comments and Questions";
                            String EmailBody =
                                " Dear Erdata App Developers, \n";

                            String EmailUrl =
                                "mailto: $EmailAddress?subject=$EmailSubject&body=$EmailBody";
                            if (await canLaunchUrlString(EmailUrl)) {
                              await launchUrlString(EmailUrl);
                            } else {
                              throw " Error occured connecting to the Email.";
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email, color: whiteColor),
                              const SizedBox(width: 16),
                              Text(
                                "EMAIL",
                                style: TextStyle(color: whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
