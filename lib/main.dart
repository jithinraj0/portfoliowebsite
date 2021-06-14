import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'admin/dashboard/dashboard_page.dart';
import 'screens/landing/landing_page.dart';
import 'utils/colors.dart';
import 'utils/styling.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
 */
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
      home: MaterialApp(
       
        title: 'Portfolio',
        theme: ThemeData(
            textTheme: textTheme(),
            scrollbarTheme: ScrollbarThemeData(
              isAlwaysShown: true,
              trackColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return kLightGreyColor.withOpacity(0.5);
                return kLightGreyColor;
              }),
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return kLightGreyColor;
                return kLightGreyColor.withOpacity(0.1);
              }),
            ),
            highlightColor: kOrangeColor),
        home: kIsWeb ? LandingPage() : DashboardScreen(),
      ),
    );
  }
}
