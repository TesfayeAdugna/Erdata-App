import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../custom_widget/drawers.dart';

class Donate extends StatelessWidget {
  const Donate({Key? key}) : super(key: key);
  final whiteColor = Colors.white;
  final String text = "Donate";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Donate'),
          backgroundColor: Color.fromARGB(255, 25, 6, 133),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
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
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(30.0),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.blue,
                  ),
                  
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_balance),
                            Text("Commercial Bank of Ethiopia", style: TextStyle(fontSize: 24, color: Colors.white),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                            ),
                            Icon(Icons.account_circle),
                            Text("10003455643544", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                            ),
                            Icon(Icons.place),
                            Text("Wello sefer branch", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                      ],
                    ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(30.0),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_balance),
                            Text("Oromia International Bank", style: TextStyle(fontSize: 24, color: Colors.white),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                            ),
                            Icon(Icons.account_circle),
                            Text("10003455643544", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                            ),
                            Icon(Icons.place),
                            Text("Wello Sefer Branch", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                      ],
                    )),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(30.0),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.purple,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_balance),
                            Text("Zemen Bank", style: TextStyle(fontSize: 24, color: Colors.white),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                            ),
                            Icon(Icons.account_circle),
                            Text("10003455643544", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                            ),
                            Icon(Icons.place),
                            Text("Wello sefer branch", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                      ],
                    )),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(30.0),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.brown,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_balance),
                            Text("Abissinia Bank", style: TextStyle(fontSize: 24, color: Colors.white),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                            ),
                            Icon(Icons.account_circle),
                            Text("10003455643544", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                            ),
                            Icon(Icons.place),
                            Text("Wello sefer branch", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                      ],
                    )),
                )
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
    );
  }
}
