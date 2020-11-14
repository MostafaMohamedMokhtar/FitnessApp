import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/pages/exercise_hub.dart';
import 'package:fitness_app/pages/exercise_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final String apiURL = 'https://raw.githubusercontent.com/codeifitech/fitness-app/'
      'master/exercises.json?fbclid=IwAR2O1gzZTZeKhkynzZpnVxU4wqS4CIFiJwRxXPB-yRKV9hAKLmEIUcthfOs';

  ExerciseHub exerciseHub ;

  @override
  void initState() {
      getExercises();

    super.initState();
  }

  getExercises() async{
    var response = await http.get(apiURL);
    var body = response.body;
    print(body);
    var jsonDecoded = jsonDecode(body);
    exerciseHub = ExerciseHub.fromJson(jsonDecoded);
    setState(() {
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
      ),
      body: Container(
        color: Color(0xFF192A56),
        child: exerciseHub != null ? ListView(
          children:
            exerciseHub.exercises.map((e) {
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseStartScreen(
                      exercises: e,
                    ),
                  ));
                },
                child: Hero(
                  tag: e.id,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child : Stack(
                      children: [


                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          /*child: FadeInImage(
                            image: NetworkImage(e.thumbnail),
                            placeholder: AssetImage('assets/placeholder.png'),
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            fit: BoxFit.cover,
                          ),*/
                          child: CachedNetworkImage(
                            imageUrl: e.thumbnail,
                            placeholder: (context, url) {
                              return Image(
                                image: AssetImage('assets/placeholder.png'),
                                width:  MediaQuery.of(context).size.width,
                                height: 250,
                                fit: BoxFit.cover,
                              );
                            },
                            errorWidget: (context, url, error) => Icon(Icons.error),
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF000000) ,
                                  Color(0x00000000) ,
                                ] ,
                                begin: Alignment.bottomCenter ,
                                end: Alignment.center
                              )
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(left: 10 , bottom: 10),
                          height: 250,
                          child: Text(e.title , style: TextStyle(fontSize: 18 , color: Colors.white),),
                        )
                      ],
                    ),
                  ),
                ),
              ) ;
            }).toList(),
        )
            : LinearProgressIndicator() ,
      ),
    );
  }
}
