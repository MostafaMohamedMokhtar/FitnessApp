import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/pages/exercise_hub.dart';
import 'package:fitness_app/pages/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartScreen extends StatefulWidget {
  Exercises exercises;

  ExerciseStartScreen({this.exercises});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: widget.exercises.id,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.exercises.thumbnail,
              placeholder: (context, url) => Image(
                image: AssetImage('assets/placeholder.png'),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xDD000000),
                Color(0x00000000),
              ], begin: Alignment.bottomCenter, end: Alignment.center)),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Container(
                width: 200,
                height: 200,
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(),
                  onChange: (double value) {
                    setState(() {
                      seconds = value.toInt();
                    });
                  },
                  min: 10,
                  max: 60,
                  initialValue: 30,
                  innerWidget: (value) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${value.toInt()} s',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // to remove underline i used >> decoration: TextDecoration.none
                            decoration: TextDecoration.none),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                child: Text('START EXERCISE' ,style: TextStyle(fontSize: 20),),
                color: Color(0xFFE83350),
                textColor: Colors.white,
                splashColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseScreen(
                      exercises: widget.exercises,
                      seconds: seconds,
                    ),
                  )) ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
