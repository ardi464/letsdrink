import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'app.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let's Drink",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Oxygen',
      ),
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: App(),
        image: Image.asset("assets/imgs/logo.png"),
        backgroundColor: Colors.red,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 150.0,
        loadingText: Text(
          'Loading',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        loaderColor: Colors.white,
      ),
    );
  }
}
