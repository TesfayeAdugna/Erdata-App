import 'package:flutter/material.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  final whiteColor = Colors.white;
  final String text = "hello";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(
        title: Text("ABOUT US"),
        appBar: AppBar(),
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
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 180, 226, 249),
                    ),
                    child: Text(
                        "We are a non-governmental, non-profit organization founded on the ideals of humanism, freedom, equality and solidarity. We consider human dignity and freedom to be fundamental values. We  believe  that people anywhere in the world should have the right to make  decisions  about  their  lives  and to  share  the rights expressed in the Universal Declaration of Human Rights."),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 180, 226, 249),
                    ),
                    child: Text(
                        "We strive for a society that is open, informed, engaged and responsible with respect to problems at home and around the world.  We  want to actively  participate in  shaping a  society where cultural, ethnic, racial and other differences are a source of enrichment rather than conflict.come and help the children.Hello Ethiopia, come and help the children.Hello Ethiopia, come and help the children.Hello Ethiopia, come and help the children."),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 180, 226, 249),
                    ),
                    child: Text(
                        "We are an intrinsic part of civil society. Our work is based on the personal initiative and activity of our team and volunteers, both in Addis Ababa and in the dozens of other cities where we operate, as well as the trust and support we are endowed with by individuals, businesses, governments and international institutions."),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Footer(),
          ],
        ),
      ),
      drawer: const DrawerExtends(
        color: Colors.black,
      ),
    );
  }
}
