import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
// import 'constant.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("name of child!"),
          ),
          backgroundColor: Colors.teal,
        ),
        drawer: const DrawerExtends(
          color: Colors.black,
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 680,
            mainAxisSpacing: 1,
            childAspectRatio: 1.2,
            crossAxisSpacing: 20,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/profile_image1.jpg",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
              child: Container(
                width: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Name : ',
                            style: kTxtKeyStyle,
                          ),
                          Text(
                            'Tesfaye Adugna',
                            style: kTxtValueStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Age : ',
                            style: kTxtKeyStyle,
                          ),
                          Text(
                            '11',
                            style: kTxtValueStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Sex : ',
                            style: kTxtKeyStyle,
                          ),
                          Text(
                            'Male',
                            style: kTxtValueStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Address : ',
                            style: kTxtKeyStyle,
                          ),
                          Text(
                            'Addis Ababa',
                            style: kTxtValueStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            // Center(
            //   child: Text(
            //     'Description',
            //     style: kTxtKeyStyle,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 18),
              child: Container(
                width: 300,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            'This child need special help. so as much as possible help him.please help him he hungry for food please help him he hungry for food',
                            style: kTxtDescription,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 18),
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Center(
                        child: Text(
                          'Donate',
                          style: kDonate,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
