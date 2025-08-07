import 'package:aayush_raj/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      endDrawer: DrawersMobile(),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  size: 35.0,
                  color: Colors.black,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/contact_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Wrap(
              runSpacing: 20.0,
              spacing: 20.0,
              alignment: WrapAlignment.center,
              children: [
                SansBold(text: "Contact me", size: 35.0),
                TextForm(
                  text: "First name",
                  containerWidth: widthDevice / 1.4,
                  hintText: "Enter your first name",
                ),
                TextForm(
                  text: "Last name",
                  containerWidth: widthDevice / 1.4,
                  hintText: "Please enter your last name",
                ),
                TextForm(
                  text: "Phone number",
                  containerWidth: widthDevice / 1.4,
                  hintText: "Enter your phone number",
                ),
                TextForm(text: "Email",
                  containerWidth: widthDevice / 1.4,
                  hintText: "Enter your email address",),
                TextForm(
                  text: "Message",
                  containerWidth: widthDevice / 1.4,
                  hintText: "Please type your message",
                  maxLine: 10,
                ),
                MaterialButton(onPressed: () {},
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60.0,
                  minWidth: widthDevice / 2.2,
                  color: Colors.tealAccent,
                  child: SansBold(text: "Submit", size: 20.0,),
                ),
                SizedBox(height: 10.0,),
              ],
            ),
          )),
    );
  }
}
