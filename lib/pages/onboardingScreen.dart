import 'package:fitness_app/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  var pages = [
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen1.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        titleTextStyle: TextStyle(color: Colors.white  , fontSize: 24),
        bodyTextStyle: TextStyle(color: Colors.white , fontSize: 16),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen2.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        titleTextStyle: TextStyle(color: Colors.white  , fontSize: 24),
        bodyTextStyle: TextStyle(color: Colors.white , fontSize: 16),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen4.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        titleTextStyle: TextStyle(color: Colors.white  , fontSize: 24),
        bodyTextStyle: TextStyle(color: Colors.white , fontSize: 16),
      ),
    )

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          // When done button is press
          Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (context) => HomeScreen()
          ));
        },
        onSkip: () {
          // You can also override onSkip callback
          Navigator.pushReplacement(context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen()
              ));
        },
        showSkipButton: true,
        skip:  Icon(Icons.skip_next ,color: Colors.white),
        next:  Icon(Icons.arrow_right ,color: Colors.white,),
        done:  Text("Done", style: TextStyle(fontWeight: FontWeight.w600 ,color: Colors.white) ),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepOrange,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
      ),
      );
  }
}
