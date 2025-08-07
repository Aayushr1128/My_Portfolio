import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;

  const TabsWeb({super.key, this.title, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isSelected = true;
            });
          },
          onExit: (_) {
            setState(() {
              isSelected = false;
            });
          },
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 100),
            curve: Curves.elasticIn,
            style: isSelected
                ? GoogleFonts.roboto(
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, -8),
                      )
                    ],
                    color: Colors.transparent,
                    fontSize: 20.0,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.tealAccent,
                    decorationThickness: 2,
                  )
                : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
            child: Text(
              widget.title,
            ),
          )),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;

  const SansBold({super.key, this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans({super.key, this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final text;
  final containerWidth;
  final hintText;
  final maxLine;
  final controller;
  final validator;

  const TextForm(
      {super.key,
      this.text,
      this.containerWidth,
      this.hintText,
      this.maxLine,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(
          text: text,
          size: 16.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLine == null ? null : maxLine,
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(fontSize: 14.0)),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  const AnimatedCard(
      {super.key,
      this.imagePath,
      this.text,
      this.fit,
      this.reverse,
      this.height,
      this.width});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 4))
        ..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
          begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
          end: widget.reverse == true ? Offset.zero : Offset(0.0, 0.08))
      .animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height == null ? 200.0 : widget.height,
                width: widget.width == null ? 200.0 : widget.width,
                fit: widget.fit == null ? null : widget.fit,
              ),
              SizedBox(
                height: 10.0,
              ),
              widget.text == null
                  ? SizedBox()
                  : SansBold(
                      text: widget.text,
                      size: 15.0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;

  const TabsMobile({super.key, this.text, this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        height: 50.0,
        minWidth: 200.0,
        color: Colors.black,
        child: Text(
          widget.text,
          style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route);
        });
  }
}

class AbleCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbleCustom(
      {super.key, this.text, this.size, this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
          fontSize: size,
          color: color == null ? Colors.black : color,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
    );
  }
}

class AddDataFirestore {
  var logger = Logger();
  CollectionReference response =
      FirebaseFirestore.instance.collection('messages');

  Future<void> addResponse(final firstName, final lastName, final email,
      final message, final phoneNumber) async {
    return response
        .add({
          'first name': firstName,
          'lastName': lastName,
          'email': email,
          'message': message,
          'phoneNumber': phoneNumber
        })
        .then((value) => logger.d("Success"))
        .catchError((error) => logger.d(error));
  }
}

Future DialogError(BuildContext context){
  return     showDialog(context: context, builder: (BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
    title: SansBold(text: "Message submitted",size: 20.0,),
  ));
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        TabsWeb(
          title: "Home",
          route: '/',
        ),
        Spacer(),
        TabsWeb(
          title: "Works",
          route: '/works',
        ),
        Spacer(),
        TabsWeb(
          title: "Blog",
          route: '/blogs',
        ),
        Spacer(),
        TabsWeb(
          title: "About",
          route: '/about',
        ),
        Spacer(),
        TabsWeb(
          title: "Contact",
          route: '/contact',
        ),
        Spacer(),
      ],
    );
  }
}

urlLauncher(String imgPath, String url) {
  return IconButton(
    onPressed: () async {
      await launchUrl(Uri.parse(url));
    },
    icon: SvgPicture.asset(imgPath, width: 35.0, color: Colors.black),
  );
}

class DrawersWeb extends StatelessWidget {
  const DrawersWeb({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/IMG_circle.png"),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SansBold(
            text: "Aayush Raj",
            size: 30.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram2.svg",
                  "https://www.instagram.com/tomcruise/"),
              urlLauncher(
                  "assets/twitter.svg", "https:/www.twitter.com/tomcruise"),
              urlLauncher(
                  "assets/github.svg", "https:/www.github.com/Aayushr1128"),
            ],
          )
        ],
      ),
    );
  }
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black)),
              child: Image.asset("assets/IMG_circle.png"),
            ),
          ),
          TabsMobile(
            text: "Home",
            route: '/',
          ),
          SizedBox(
            height: 20.0,
          ),
          TabsMobile(
            text: "Works",
            route: '/works',
          ),
          SizedBox(
            height: 20.0,
          ),
          TabsMobile(
            text: "Blogs",
            route: '/blogs',
          ),
          SizedBox(
            height: 20.0,
          ),
          TabsMobile(
            text: "About",
            route: '/about',
          ),
          SizedBox(
            height: 20.0,
          ),
          TabsMobile(
            text: "Contact",
            route: '/contact',
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram2.svg",
                  "https://www.instagram.com/tomcruise/"),
              urlLauncher(
                  "assets/twitter.svg", "https:/www.twitter.com/tomcruise"),
              urlLauncher(
                  "assets/github.svg", "https:/www.github.com/Aayushr1128"),
            ],
          )
        ],
      ),
    );
  }
}


