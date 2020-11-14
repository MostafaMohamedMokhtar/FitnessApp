import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/pages/exercise_hub.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ExerciseScreen extends StatefulWidget {
  Exercises exercises;

  final int seconds;

  ExerciseScreen({this.exercises, this.seconds});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int elapsedSeconds = 0;

  bool isCompleted = false;

  Timer timer;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache() ;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();
        setState(() {
          isCompleted = true ;
        });
        playAudio();
      }
      setState(() {
        elapsedSeconds = t.tick;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void playAudio(){
    audioCache.play('clapping.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            //color: Color(0xEE192A56),
            color: Colors.white,
            child: CachedNetworkImage(
              imageUrl: widget.exercises.gif,
              placeholder: (context, url) => Image(
                image: AssetImage('assets/placeholder.png'),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          isCompleted != true ? SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              alignment: Alignment.topCenter,
              child: Text('$elapsedSeconds / ${widget.seconds} S'),
            ),
          ) : Container(),
          SafeArea(
            minimum: EdgeInsets.only(top: 40 , right: 10),
            child: Container(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
