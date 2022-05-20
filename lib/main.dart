import 'package:flutter/material.dart';
import 'package:flutter_app/views/login.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(
            // Todo check if user is logged in and take the to dashboard or login page
            seconds: 5,
            navigateAfterSeconds:const LoginPage(),
            title: const Text(
              'Smart Saver',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            photoSize: 100.0,
            backgroundColor: Colors.green,
            styleTextUnderTheLoader: const TextStyle(),
            loaderColor: Colors.white
        )
    );
  }
}