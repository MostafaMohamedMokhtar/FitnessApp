import 'package:fitness_app/pages/onboardingScreen.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      theme:ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF192A56) ,
        ),
      )

    );
  }
}
