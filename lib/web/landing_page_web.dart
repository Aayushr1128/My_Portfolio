import 'package:aayush_raj/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {

  var logger = Logger();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        title: TabsWebList(),
      ),
      body: ListView(
        children: [
          Container(
            height: heightDevice - 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        child: SansBold(
                          text: "Hello I'm",
                          size: 15.0,
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    SansBold(
                      text: "Aayush Raj",
                      size: 55.0,
                    ),
                    Sans(text: "Flutter Developer", size: 30.0),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans(
                          text: "singhaayushraj141@gmail.com",
                          size: 15.0,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans(
                          text: "+916204271449",
                          size: 15.0,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans(
                          text: "Adityapur,Jamshedpur",
                          size: 15.0,
                        ),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/IMG_circle.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Second Page
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/web.jpg",
                  height: widthDevice / 1.9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(
                      text: "About me",
                      size: 40.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Sans(
                      text:
                          "Hello I'm Aayush Raj I specialize in flutter development",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "I Strive to ensure astounding performance with state of",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "The art security for Android, Ios, Web, Mac, Linux and Windows ",
                      size: 15.0,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(
                            text: "Flutter",
                            size: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(
                            text: "Firebase",
                            size: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(
                            text: "Android",
                            size: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(
                            text: "ios",
                            size: 15.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

          /// Third Section
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold(
                  text: "What I do?",
                  size: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/webL.png",
                      text: "App Development",
                    ),
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: "Web Development",
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      text: "Back-End Development",
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Fourth Section
          Container(
            height: heightDevice,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold(
                    text: "Contact me",
                    size: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextForm(
                            text: "First Name",
                            hintText: "Please type your first name",
                            containerWidth: 350.0,
                            controller: _firstNameController,
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "First name is required";
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextForm(
                            text: "Email",
                            hintText: "Please type your email address",
                            containerWidth: 350.0,
                            controller: _emailController,
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Email is required";
                              }
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextForm(
                            text: "Last Name",
                            hintText: "Please type your last name",
                            containerWidth: 350.0,
                            controller: _lastNameController,
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Last name is required";
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextForm(
                            text: "Phone Number",
                            hintText: "Please type your phone number",
                            containerWidth: 350.0,
                            controller: _phoneController,
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Phone number is required";
                              }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextForm(
                    text: "Message",
                    containerWidth: widthDevice / 1.5,
                    hintText: "Please type your message",
                    maxLine: 10,
                    controller: _messageController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Message is required";
                      }
                    },
                  ),
                  MaterialButton(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 60.0,
                      minWidth: 200.0,
                      color: Colors.tealAccent,
                      child: SansBold(
                        text: "Submit",
                        size: 20.0,
                      ),
                      onPressed: () async {
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
                      }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
