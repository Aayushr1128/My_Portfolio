import 'package:aayush_raj/common/blog.dart';
import 'package:aayush_raj/mobile/about_mobile.dart';
import 'package:aayush_raj/mobile/landing_page_mobile.dart';
import 'package:aayush_raj/mobile/works_mobile.dart';
import 'package:aayush_raj/web/about_web.dart';
// import 'package:aayush_raj/web/blog_web.dart';
import 'package:aayush_raj/web/contact_web.dart';
import 'package:aayush_raj/web/landing_page_web.dart';
import 'package:aayush_raj/web/works_web.dart';
import 'package:flutter/material.dart';
import 'mobile/contact_mobile.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(settings: settings,
          builder: (_) => LayoutBuilder(builder: (context,constraint){
            if(constraint.maxWidth > 800){
              return LandingPageWeb();
            }
            else return LandingPageMobile();
          })
        );
      case '/contact':
        return MaterialPageRoute(settings: settings,
            builder: (_) => LayoutBuilder(builder: (context,constraint){
              if(constraint.maxWidth > 800){
                return ContactWeb();
              }
              else return ContactMobile();
            })
        );
      case '/about':
        return MaterialPageRoute(settings: settings,
            builder: (_) => LayoutBuilder(builder: (context,constraint){
              if(constraint.maxWidth > 800){
                return AboutWeb();
              }
              else return AboutMobile();
            })
        );
      case '/blogs':
        return MaterialPageRoute(
          builder: (_) => Blog(),
          settings: settings,
        );
      case '/works':
        return MaterialPageRoute(settings: settings,
            builder: (_) => LayoutBuilder(builder: (context,constraint){
              if(constraint.maxWidth > 800){
                return WorksWeb();
              }
              else return WorksMobile();
            })
        );
      default:
        return MaterialPageRoute(settings: settings,
            builder: (_) => LayoutBuilder(builder: (context,constraint){
              if(constraint.maxWidth>800){
                return LandingPageWeb();
              }
              else return LandingPageMobile();
            })
        );
    }
  }
}