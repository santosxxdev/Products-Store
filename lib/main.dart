import 'package:flutter/material.dart';
import 'package:splach_with_login_firebase/Pages/home_page.dart';
import 'package:splach_with_login_firebase/Pages/login_page.dart';
import 'package:splach_with_login_firebase/Pages/sginup_page.dart';
import 'package:splach_with_login_firebase/Theme/theme_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Login',
      theme: ThemeApp.light,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routName,
      routes: {
        HomePage.routName : (context) => HomePage(),
        LoginPage.routName: (context) => LoginPage(),
        SginupPage.routName: (context) => SginupPage(),
      },
    );
  }
}
