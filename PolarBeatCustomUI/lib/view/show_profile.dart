import 'package:custom_polar_beat_ui_v2/model/model.dart';
import 'package:custom_polar_beat_ui_v2/view/exercise_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import 'graphs/fast_iso.dart';


class ShowProfile extends StatefulWidget {
  const ShowProfile({Key? key}) : super(key: key);

  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {

  late List<Map<dynamic,dynamic>> topDistanceActivities;
  late List<Map<dynamic,dynamic>> topCaloriesActivities;
  late List<Map<dynamic,dynamic>> topDurationActivities;

  @override
  Widget build(BuildContext context) {
    Map profile = Provider.of<AppState>(context).profile;
    topDistanceActivities = Provider.of<AppState>(context).topDistance;
    topDurationActivities = Provider.of<AppState>(context).topDuration;
    topCaloriesActivities = Provider.of<AppState>(context).topCalories;
    int cal=Provider.of<AppState>(context).totalCalories;
    int dis=Provider.of<AppState>(context).totalDistance;
    Duration dur=Provider.of<AppState>(context).totalTime;
    Color main=Provider.of<AppState>(context).main;
    Color second=Provider.of<AppState>(context).second;
    int localCalories=Provider.of<AppState>(context).localCalories;
    int localDistance=Provider.of<AppState>(context).localDistance;

    String realname=profile["firstname"] ?? "";

    return Scaffold(
      backgroundColor: const Color(0xff121421),
      body: SafeArea(
        child: Stack(
          children: [


            Scaffold(
              backgroundColor: main,
                      body: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          "Hello! ",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        Text(
                          realname,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: SizedBox(
                            height: 300,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Text(
                                    "Total energy",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    cal.toString()+" kcal",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Text(
                                    "Total Distance",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    dis.toString()+" kilometers",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Text(
                                    "Total Time",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: second),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    dur.inMinutes.toString()+ " minutes",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: second),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16,
                                      top: 16,
                                    ),
                                    child: Text(
                                      "Distance for today",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Text(
                                      localCalories.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                    ),
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16,
                                      top: 16,
                                    ),
                                    child: Text(
                                      "Calories for today",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Text(
                                      localDistance.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                "Most calories exercises",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: topCaloriesActivities.length,
                            itemBuilder: (context, i) {
                              if (i == topCaloriesActivities.length) {
                                return  const CupertinoActivityIndicator();
                              }
                              return Bounceable(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ExerciseDetails(data: topCaloriesActivities.elementAt(i), color: main, second: second)));
                                },
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                          second,
                                          main
                                        ]).createShader(bounds);
                                      },
                                      blendMode: BlendMode.srcATop,
                                      child: const Icon(
                                        Icons.accessibility,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    topCaloriesActivities.elementAt(i)['sport'].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  subtitle: Text(
                                    DateTime.parse(topCaloriesActivities.elementAt(i).entries.elementAt(5).value).toString().substring(0,19),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  trailing: Text((topCaloriesActivities.elementAt(i)["calories"]).toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                      )),
                                ),
                              );
                            }),


                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                "Longest distance exercises",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      /*  onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ExerciseDetails(data: topCaloriesActivities.elementAt(i), color: main, second: second)));
                        },*/

                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: topDistanceActivities.length,
                            itemBuilder: (context, i) {
                              if (i == topDistanceActivities.length) {
                                return  const CupertinoActivityIndicator();
                              }
                              return Bounceable(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ExerciseDetails(data: topDistanceActivities.elementAt(i), color: main, second: second)));
                                },
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                          second,
                                          main
                                        ]).createShader(bounds);
                                      },
                                      blendMode: BlendMode.srcATop,
                                      child: const Icon(
                                        Icons.accessibility,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    topDistanceActivities.elementAt(i)['sport'].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  subtitle: Text(
                                    DateTime.parse(topDistanceActivities.elementAt(i).entries.elementAt(5).value).toString().substring(0,19),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  trailing: Text((topDistanceActivities.elementAt(i)["distance"]).toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                      )),
                                ),
                              );
                            }),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                "Longest duration exercises",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: topCaloriesActivities.length,
                            itemBuilder: (context, i) {
                              if (i == topCaloriesActivities.length) {
                                return  const CupertinoActivityIndicator();
                              }
                              return Bounceable(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ExerciseDetails(data: topCaloriesActivities.elementAt(i), color: main, second: second)));
                                },
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                          second,
                                          main
                                        ]).createShader(bounds);
                                      },
                                      blendMode: BlendMode.srcATop,
                                      child: Icon(
                                        Icons.accessibility,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    topCaloriesActivities.elementAt(i)['sport'].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  subtitle: Text(
                                    DateTime.parse(topCaloriesActivities.elementAt(i).entries.elementAt(5).value).toString().substring(0,19),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  trailing: Text( toDuration(topDurationActivities.elementAt(i)["duration"]).toString().substring(0,7),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      )),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
    ),
    ),
        //

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                        stops: const [0,1],
                        colors: [
                          second,
                          main
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                    )
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }

  void onStartButtonPressed() {

  }


}