import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    print("Last time opened: $lastTimeOpened");
    if (lastTimeOpened == null) {
      return true; // its a New day bc I've never opened this app before, so has to be first time for today
    } else {
      DateTime lastTimeOpenedObj = DateTime.parse(lastTimeOpened);
      DateTime now = DateTime.now();

      if (now.year != lastTimeOpenedObj.year) {
        //it's a different year so def first time run today
        return true;
      } else {
        if (now.month != lastTimeOpenedObj.month) {
          //Same year, different month
          return true;
        } else {
          //its the same year and same month
          //Probably within the same day
          //start by checking for difference of around 4 hours
          if (now.hour - lastTimeOpenedObj.hour >= 4) {
            //Differencce of 4 hours
            //Case: I close the app at 11:45 and open it at 12:15
            if (now.day != lastTimeOpenedObj.day) {
              //more than 4 hour difference and its different days then im probably asleep
              return true;
            }
            if (lastTimeOpenedObj.hour <= 3 && now.hour < 12) {
              //Same day, more than 4 hour difference, last time was before 3 and now is before noon so i just woke up
              return true;
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
              child: const HeaderComponent(),
            ),
            SizedBox(
              height: deviceSize.size.height * spaceBetweenCards,
            ),
            Container(
              // color: Colors.red,
              height: deviceSize.size.height * weatherComponentContainerSize,
              child: const WeatherComponent(),
            ),
            SizedBox(
              height: deviceSize.size.height * spaceBetweenCards,
            ),
            SizedBox(
              height: deviceSize.size.height * reminderComponentContainerSize,
              child: FutureBuilder<bool>(
                future: checkForFirstTimeBeingRunToday(),
                initialData: false,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      print("Snapshot data ${snapshot.data}");
                      return ReminderComponent(newDay: snapshot.data!);
                    }
                  }
                  return const Text("Error");
                },
              ),
            ),
            SizedBox(
              height: deviceSize.size.height * spaceBetweenCards,
            ),
            Container(
              // color: Colors.green,
              height: deviceSize.size.height * todoComponentContainerSize,
              child: FutureBuilder<bool>(
                future: checkForFirstTimeBeingRunToday(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return TodoListComponent(newDay: snapshot.data!);
                    }
                  }
                  return const Text("Error");
                },
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
