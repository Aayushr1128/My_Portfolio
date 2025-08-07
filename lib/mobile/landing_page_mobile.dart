import 'package:aayush_raj/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {

  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.tealAccent,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0)),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 15.0),
      ),
    );
  }

  var logger = Logger();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawersMobile(),
        body: ListView(
          children: [
            ///Intro, First section
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 117.0,
                    backgroundColor: Colors.tealAccent,
                    child: CircleAvatar(
                      radius: 110.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/IMG_circle.png"),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: SansBold(text: "Hello I'm", size: 15.0),
                      ),
                      SansBold(
                        text: "Aayush Raj",
                        size: 40.0,
                      ),
                      SansBold(
                        text: "Flutter developer",
                        size: 20.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans(
                            text: "singhaayushraj141@gmail.com",
                            size: 15.0,
                          ),
                          Sans(
                            text: "+916204271449",
                            size: 15.0,
                          ),
                          Sans(
                            text: "Adityapur, Jamshedpur ",
                            size: 15.0,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 90.0,
            ),

            ///About me, second section
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold(
                    text: "About me",
                    size: 35.0,
                  ),
                  Sans(
                    text:
                        "Hello I'm Aayush Raj I specialize in flutter developer",
                    size: 15.0,
                  ),
                  Sans(
                    text:
                        "I strive to ensue astounding performance with state of ",
                    size: 15.0,
                  ),
                  Sans(
                    text: "The art security for Android, Ios, Web, Mac, Linux",
                    size: 15.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    spacing: 7.0,
                    runSpacing: 7.0,
                    children: [
                      tealContainer("Flutter"),
                      tealContainer("Firebase"),
                      tealContainer("Android"),
                      tealContainer("Windows"),
                      tealContainer("Ios"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),

            /// What i do?
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold(
                  text: "What I do?",
                  size: 35.0,
                ),
                AnimatedCard(
                  imagePath: "assets/webL.png",
                  text: "App Development",
                  width: 300.0,
                ),
                SizedBox(
                  height: 35.0,
                ),
                AnimatedCard(
                  imagePath: "assets/app.png",
                  text: "Web Development",
                  width: 300.0,
                  fit: BoxFit.contain,
                  reverse: true,
                ),
                SizedBox(
                  height: 35.0,
                ),
                AnimatedCard(
                  imagePath: "assets/firebase.png",
                  text: "Back-End Development",
                  width: 300.0,
                ),
                SizedBox(
                  height: 35.0,
                ),

                /// Contact
                Form(
                  key: formKey,
                  child: Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    alignment: WrapAlignment.center,
                    children: [
                      SansBold(
                        text: "Contact me",
                        size: 35.0,
                      ),
                      TextForm(
                        text: "First Name",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Please type first name",
                        controller: _firstNameController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "First name is required";
                          }
                        },
                      ),
                      TextForm(
                        text: "Last Name",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Please type last name",
                        controller: _lastNameController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Last name is required";
                          }
                        },
                      ),
                      TextForm(
                        text: "Email",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Please type email address",
                        controller: _emailController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Email is required";
                          }
                        },
                      ),
                      TextForm(
                        text: "Phone number",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Please type your phone number",
                        controller: _phoneController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Phone number is required";
                          }
                        },
                      ),
                      TextForm(
                        text: "Message",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Message",
                        maxLine: 10,
                        controller: _messageController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Message is required";
                          }
                        },
                      ),
                      MaterialButton(onPressed: ()async {
                        logger.d(_firstNameController.text);
                        final addData = new AddDataFirestore();
                        if (formKey.currentState!.validate()) {
                          await addData.addResponse(
                              _firstNameController.text,
                              _lastNameController.text,
                              _emailController.text,
                              _messageController.text,
                              _phoneController.text);
                          formKey.currentState!.reset();
                          DialogError(context);
                        }
                      },
                        elevation: 20.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 60.0,
                        minWidth: widthDevice/2.2,
                        color: Colors.tealAccent,
                        child: SansBold(text: "Submit",size: 20.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
