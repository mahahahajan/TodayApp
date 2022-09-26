import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:today_app/components/header_component.dart';
import 'package:today_app/components/weather_component.dart';
import 'package:today_app/components/reminder_component.dart';
import 'package:today_app/components/todo_list_component.dart';
import 'package:today_app/constants.dart';

class TodayHomePage extends StatefulWidget {
  const TodayHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<TodayHomePage> createState() => _TodayHomePageState();
}

class _TodayHomePageState extends State<TodayHomePage>
    with WidgetsBindingObserver {
  late SharedPreferences prefs;
  late bool newDay;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // checkForFirstTimeBeingRunToday();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) return;

    final isBackground = state == AppLifecycleState.paused;

    if (isBackground) {
      prefs.setString('lastTimeOpened', DateTime.now().toString());
      print("Setting lastTimeOpened to ");
      print(prefs.getString('lastTimeOpened'));
    }
  }

  Future<bool> checkForFirstTimeBeingRunToday() async {
    prefs = await SharedPreferences.getInstance();
    var lastTimeOpened = prefs.getString('lastTimeOpened');
    print(lastTimeOpened);
    if (lastTimeOpened == null) {
      return true; // its a New day bc I've never opened this app before, so has to be first time for today
    } else {
      DateTime lastTimeOpenedObj = DateTime.parse(lastTimeOpened);
      if (lastTimeOpenedObj.hour > 5 && lastTimeOpenedObj.hour < 8) {
        //It's a new day because I opened this after midnight last time if i did, so I probably slept since
        // itsANewDay();
        return true;
      } else {
        //hour >= 8
        //Check if theres a greater than 1 difference between last timeOpened
        var now = DateTime.now();
        if (now.year == lastTimeOpenedObj.year) {
          print("same year");
          if (now.month == lastTimeOpenedObj.month) {
            print("same month");
            //little overkill but for the sake of being thorough
            if (now.day - lastTimeOpenedObj.day >= 1) {
              // if (now.minute - lastTimeOpenedObj.minute >= 1) {
              //   print("IT is a new day");
              //   return true;
              // }
              //the day has changed since last time
              // itsANewDay();
              return true;
            }
          }
        }
      }
    }
    // setState(() {
    //   newDay = false;
    //   print(false);
    // });
    return false;
  }

  void itsANewDay() {
    setState(() {
      newDay = true;
      print(true);
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)

          // to see the wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              // color: Colors.white,
              height: deviceSize.size.height * headerComponentContainerSize,
              child: HeaderComponent(),
            ),
            SizedBox(
              height: deviceSize.size.height * spaceBetweenCards,
            ),
            Container(
              // color: Colors.red,
              height: deviceSize.size.height * weatherComponentContainerSize,
              child: WeatherComponent(),
            ),
            SizedBox(
              height: deviceSize.size.height * spaceBetweenCards,
            ),
            SizedBox(
              height: deviceSize.size.height * reminderComponentContainerSize,
              child: FutureBuilder<bool>(
                future: checkForFirstTimeBeingRunToday(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data == true) {
                      return ReminderComponent(newDay: true);
                    }
                  }
                  return ReminderComponent(newDay: false);
                },
              ),
            ),
            SizedBox(
              height: deviceSize.size.height * spaceBetweenCards,
            ),
            Container(
              // color: Colors.green,
              height: deviceSize.size.height * todoComponentContainerSize,
              child: TodoListComponent(),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
