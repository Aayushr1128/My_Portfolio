import 'package:aayush_raj/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCfdIuD_btRZN3rojWD7-I8_eEYuRyNG1c",
          authDomain: "aayush-raj-fc2ef.firebaseapp.com",
          projectId: "aayush-raj-fc2ef",
          storageBucket: "aayush-raj-fc2ef.firebasestorage.app",
          messagingSenderId: "583323424480",
          appId: "1:583323424480:web:779690aa5abac00ac4e285",
          measurementId: "G-B256CT42VS"
      )
    );
  }
  else{
    GoogleFonts.config.allowRuntimeFetching = false;
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: '/',
    );
  }
}




