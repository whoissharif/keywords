import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:programming_keyword/splash_screen.dart';
import 'pages/homepage.dart';
// import 'package:device_preview/device_preview.dart';

// void main() => runApp(DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(),
//     ));
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // //DP
      // locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      // //
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/Homepage': (BuildContext context) => Homepage()
      },
    );
  }
}
