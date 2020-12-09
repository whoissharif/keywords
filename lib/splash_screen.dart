import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Homepage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(children: [
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Programming',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            Text(
              'Keyword',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
