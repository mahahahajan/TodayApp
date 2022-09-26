import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:today_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:today_app/constants.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(const TodayApp());
}

class TodayApp extends StatelessWidget {
  const TodayApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Today App - Today at a Glance',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        //Use dark theme, change some things
        primaryColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: headerTextColor,
        ),
        applyElevationOverlayColor: false,
      ),
      home: const TodayHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//DEV: Run below with Chrome as Device to get responsive previews for multiple devices
// void main() {
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => TodayApp(), // Wrap your app
//     ),
//   );
// }

// class TodayApp extends StatelessWidget {
//   const TodayApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Today App - Today at a Glance',
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       theme: ThemeData.dark().copyWith(
//         useMaterial3: true,
//         //Use dark theme, change some things
//         primaryColor: backgroundColor,
//         scaffoldBackgroundColor: backgroundColor,
//         textTheme: GoogleFonts.poppinsTextTheme().apply(
//           bodyColor: headerTextColor,
//         ),
//         applyElevationOverlayColor: false,
//       ),
//       home: const TodayHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
