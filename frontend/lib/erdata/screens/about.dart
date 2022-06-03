import 'package:flutter/material.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  final whiteColor = Colors.white;
  final String text = "hello";
  final String contact =
      "PHONE NUMBER: +251 92312223 \n TELEGRAM : https://telegram.me/Ashbel0 \n EMAIL: arunokijonathan@gmail.com \n INSTAGRAM: https://instagram.com/tesfishadugna/ \n FACEBOOK: https://facebook.com/people/Tesfaye-Adugna/100077814634008/ \n ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(
        title: " ",
        appBar: AppBar(),
      ),
      drawer: const DrawerExtends(
        color: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 71, 52, 52).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: [
                        Text(
                          "About Us",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 194, 124, 3),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "We are a non-governmental, non-profit organization founded on the ideals of humanism, freedom, equality and solidarity. We consider human dignity and freedom to be fundamental values. We  believe  that people anywhere in the world should have the right to make  decisions  about  their  lives  and to  share  the rights expressed in the Universal Declaration of Human Rights.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 71, 52, 52).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: [
                        Text(
                          "Our Missions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 194, 124, 3),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "We strive for a society that is open, informed, engaged and responsible with respect to problems at home and around the world.  We  want to actively  participate in  shaping a  society where cultural, ethnic, racial and other differences are a source of enrichment rather than conflict.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 71, 52, 52).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: [
                        Text(
                          "Our Dimensions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 194, 124, 3),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "We  determine the  specific  areas and priorities of our activities with respect to the level of urgency and our actual capacity to change the situation. We cannot be everywhere, but it is essential that our work makes a real difference.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 71, 52, 52).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      contact,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Footer(),
          ],
        ),
      ),
    );
  }
}
