import 'package:aayush_raj/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
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

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/IMG_circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
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
                      text:
                          "The art security for Android, Ios, Web, Mac, Linux",
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
                height: 40.0,
              ),

              ///Web development
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/webL.png",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold(
                    text: "Web Development",
                    size: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Sans(
                text:
                    "I'm here to build your presence online with state of the art web apps",
                size: 15.0,
              ),

              ///App development
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(height: 30.0),
                  SansBold(
                    text: "App Development",
                    size: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Sans(
                text: "Do you need a high-performance,"
                    " responsive and beautiful app."
                    " Don't worry I've got you covered.",
                size: 15.0,
              ),

              ///Back-end Development
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/firebase.png",
                    width: 200.0,
                  ),
                  SizedBox(height: 30.0),
                  SansBold(
                    text: "Back-end Development",
                    size: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Sans(
                text: "Do you want your back-end"
                    " to be highly scalable and secure? "
                    "Let's have a conversation on how i can help you with that",
                size: 15.0,
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
