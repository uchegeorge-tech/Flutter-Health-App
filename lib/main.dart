import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/screen/day-two.dart';
import 'screen/day-one.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day One',
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        child: HomeScreen(),
        value:  SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light
        ),
      ),
    );
  }
}
